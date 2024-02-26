## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53, < 6 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 3.53, < 6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.53, < 6 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >= 3.53, < 6 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mig"></a> [mig](#module\_mig) | terraform-google-modules/vm/google//modules/mig | ~> 7.0 |
| <a name="module_mig_template"></a> [mig\_template](#module\_mig\_template) | terraform-google-modules/vm/google//modules/instance_template | ~> 7.0 |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_secret_manager_secret.gh-secret](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_secret_manager_secret) | resource |
| [google-beta_google_secret_manager_secret_iam_member.gh-secret-member](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_secret_manager_secret_iam_member) | resource |
| [google-beta_google_secret_manager_secret_version.gh-secret-version](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_secret_manager_secret_version) | resource |
| [google_compute_network.gh-network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.gh-subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_service_account.runner_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cooldown_period"></a> [cooldown\_period](#input\_cooldown\_period) | The number of seconds that the autoscaler should wait before it starts collecting information from a new instance. | `number` | `60` | no |
| <a name="input_create_network"></a> [create\_network](#input\_create\_network) | When set to true, VPC,router and NAT will be auto created | `bool` | `true` | no |
| <a name="input_create_subnetwork"></a> [create\_subnetwork](#input\_create\_subnetwork) | Whether to create subnetwork or use the one provided via subnet\_name | `bool` | `true` | no |
| <a name="input_custom_metadata"></a> [custom\_metadata](#input\_custom\_metadata) | User provided custom metadata | `map(any)` | `{}` | no |
| <a name="input_gh_runner_labels"></a> [gh\_runner\_labels](#input\_gh\_runner\_labels) | GitHub runner labels to attach to the runners. Docs: https://docs.github.com/en/actions/hosting-your-own-runners/using-labels-with-self-hosted-runners | `set(string)` | `[]` | no |
| <a name="input_gh_token"></a> [gh\_token](#input\_gh\_token) | Github token that is used for generating Self Hosted Runner Token | `string` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The GCP machine type to deploy | `string` | `"n1-standard-1"` | no |
| <a name="input_max_replicas"></a> [max\_replicas](#input\_max\_replicas) | Maximum number of runner instances | `number` | `10` | no |
| <a name="input_min_replicas"></a> [min\_replicas](#input\_min\_replicas) | Minimum number of runner instances | `number` | `2` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name for the VPC network | `string` | `"gh-runner-network"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project id to deploy Github Runner | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The GCP region to deploy instances into | `string` | `"us-east4"` | no |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | Name of the repo for the Github Action | `string` | `""` | no |
| <a name="input_repo_owner"></a> [repo\_owner](#input\_repo\_owner) | Owner of the repo for the Github Action | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service account email address | `string` | `""` | no |
| <a name="input_shutdown_script"></a> [shutdown\_script](#input\_shutdown\_script) | User shutdown script to run when instances shutdown | `string` | `""` | no |
| <a name="input_source_image"></a> [source\_image](#input\_source\_image) | Source disk image. If neither source\_image nor source\_image\_family is specified, defaults to the latest public CentOS image. | `string` | `""` | no |
| <a name="input_source_image_family"></a> [source\_image\_family](#input\_source\_image\_family) | Source image family. If neither source\_image nor source\_image\_family is specified, defaults to the latest public Ubuntu image. | `string` | `"ubuntu-2004-lts"` | no |
| <a name="input_source_image_project"></a> [source\_image\_project](#input\_source\_image\_project) | Project where the source image comes from | `string` | `"ubuntu-os-cloud"` | no |
| <a name="input_startup_script"></a> [startup\_script](#input\_startup\_script) | User startup script to run when instances spin up | `string` | `""` | no |
| <a name="input_subnet_ip"></a> [subnet\_ip](#input\_subnet\_ip) | IP range for the subnet | `string` | `"10.10.10.0/24"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Name for the subnet | `string` | `"gh-runner-subnet"` | no |
| <a name="input_subnetwork_project"></a> [subnetwork\_project](#input\_subnetwork\_project) | The ID of the project in which the subnetwork belongs. If it is not provided, the project\_id is used. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mig_instance_group"></a> [mig\_instance\_group](#output\_mig\_instance\_group) | The instance group url of the created MIG |
| <a name="output_mig_instance_template"></a> [mig\_instance\_template](#output\_mig\_instance\_template) | The name of the MIG Instance Template |
| <a name="output_mig_name"></a> [mig\_name](#output\_mig\_name) | The name of the MIG |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Name of VPC |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | Service account email for GCE |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | Name of VPC |

