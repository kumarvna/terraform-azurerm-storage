output "storage_account_id" {
  value       = module.storage.storage_account_id
  description = "The ID of the storage account."
}

output "sorage_account_name" {
  value       = module.storage.sorage_account_name
  description = "The name of the storage account."
}

output "storage_primary_connection_string" {
  value       = module.storage.storage_primary_connection_string
  description = "The primary connection string for the storage account."
}

output "storage_primary_access_key" {
  value       = module.storage.storage_primary_access_key
  description = "The primary access key for the storage account."
}

output "containers" {
  value = module.storage.containers
  description = "Map of containers."
}

output "file_shares" {
  value = module.storage.file_shares
  description = "storage SMB file shares list"
}

