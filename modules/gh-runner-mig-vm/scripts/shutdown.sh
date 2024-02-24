secretUri=$(curl -sS "http://metadata.google.internal/computeMetadata/v1/instance/attributes/secret-id" -H "Metadata-Flavor: Google")
# secrets URI is of the form projects/$PROJECT_NUMBER/secrets/$SECRET_NAME/versions/$SECRET_VERSION
# split into array based on `/` delimeter
IFS="/" read -r -a secretsConfig <<<"$secretUri"
# get SECRET_NAME and SECRET_VERSION
SECRET_NAME=${secretsConfig[3]}
SECRET_VERSION=${secretsConfig[5]}
# access secret from secretsmanager
secrets=$(gcloud secrets versions access "$SECRET_VERSION" --secret="$SECRET_NAME")
# set secrets as env vars
# shellcheck disable=SC2046
# we want to use wordsplitting
export $(echo "$secrets" | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]")
# stop and uninstall the runner service
cd /runner || exit
./svc.sh stop
./svc.sh uninstall
if [[ -z $REPO_NAME ]]; then
    # remove action runner from the organisation
    POST_URL="https://api.github.com/orgs/${REPO_OWNER}/actions/runners/remove-token"
else
    # remove action runner from the repo
    POST_URL="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/actions/runners/remove-token"
fi
# remove the runner configuration
RUNNER_ALLOW_RUNASROOT=1 /runner/config.sh remove --unattended --token "$(curl -sS --request POST --url "$POST_URL" --header "authorization: Bearer ${GITHUB_TOKEN}" --header "content-type: application/json" | jq -r .token)"
