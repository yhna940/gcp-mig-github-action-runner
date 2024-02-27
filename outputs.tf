output "mig_instance_group" {
  description = "The instance group url of the created MIG"
  value       = module.runner-mig.mig_instance_group
}

output "mig_name" {
  description = "The name of the MIG"
  value       = module.runner-mig.mig_name
}

output "service_account" {
  description = "Service account email for GCE"
  value       = module.runner-mig.service_account
  sensitive   = true
}

output "mig_instance_template" {
  description = "The name of the MIG Instance Template"
  value       = module.runner-mig.mig_instance_template
}
