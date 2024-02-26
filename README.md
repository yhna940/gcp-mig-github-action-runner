# gcp-mig-github-action-runner

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_runner-mig"></a> [runner-mig](#module\_runner-mig) | ./modules/gh-runner-mig-vm | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gh_token"></a> [gh\_token](#input\_gh\_token) | Github token that is used for generating Self Hosted Runner Token | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project id to deploy Github Runner MIG | `string` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Name of the repo for the Github Action | `string` | n/a | yes |
| <a name="input_repo_owner"></a> [repo\_owner](#input\_repo\_owner) | Owner of the repo for the Github Action | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mig_instance_group"></a> [mig\_instance\_group](#output\_mig\_instance\_group) | The instance group url of the created MIG |
| <a name="output_mig_instance_template"></a> [mig\_instance\_template](#output\_mig\_instance\_template) | The name of the MIG Instance Template |
| <a name="output_mig_name"></a> [mig\_name](#output\_mig\_name) | The name of the MIG |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | Service account email for GCE |

