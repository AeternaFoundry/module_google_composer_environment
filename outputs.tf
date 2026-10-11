output "composer_environments_id" {
  description = "Map of id values across all composer_environments, keyed the same as var.composer_environments except keys with no id are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => v.id if v.id != null && length(v.id) > 0 }
}
output "composer_environments_config" {
  description = "Map of config values across all composer_environments, keyed the same as var.composer_environments except keys with no config are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => one(v.config) if v.config != null && length(v.config) > 0 }
}
output "composer_environments_deletion_policy" {
  description = "Map of deletion_policy values across all composer_environments, keyed the same as var.composer_environments except keys with no deletion_policy are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "composer_environments_effective_labels" {
  description = "Map of effective_labels values across all composer_environments, keyed the same as var.composer_environments except keys with no effective_labels are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "composer_environments_labels" {
  description = "Map of labels values across all composer_environments, keyed the same as var.composer_environments except keys with no labels are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "composer_environments_name" {
  description = "Map of name values across all composer_environments, keyed the same as var.composer_environments except keys with no name are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => v.name if v.name != null && length(v.name) > 0 }
}
output "composer_environments_project" {
  description = "Map of project values across all composer_environments, keyed the same as var.composer_environments except keys with no project are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => v.project if v.project != null && length(v.project) > 0 }
}
output "composer_environments_region" {
  description = "Map of region values across all composer_environments, keyed the same as var.composer_environments except keys with no region are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => v.region if v.region != null && length(v.region) > 0 }
}
output "composer_environments_storage_config" {
  description = "Map of storage_config values across all composer_environments, keyed the same as var.composer_environments except keys with no storage_config are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => one(v.storage_config) if v.storage_config != null && length(v.storage_config) > 0 }
}
output "composer_environments_terraform_labels" {
  description = "Map of terraform_labels values across all composer_environments, keyed the same as var.composer_environments except keys with no terraform_labels are omitted"
  value       = { for k, v in google_composer_environment.composer_environments : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}

