terraform {
  required_version = ">= 0.13"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 3.53, < 6"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 3.53, < 6"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-github-actions-runners:gh-runner-mig-vm/v3.1.2"
  }

}
