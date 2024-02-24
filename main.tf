module "runner-mig" {
  source = "./modules/gh-runner-mig-vm"

  create_network = true
  project_id     = var.project_id
  repo_name      = var.repo_name
  repo_owner     = var.repo_owner
  gh_token       = var.gh_token
}
