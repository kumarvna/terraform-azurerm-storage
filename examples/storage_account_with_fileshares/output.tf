output "storage_account_id" {
  value       = module.storageacc.storage_account_id
  description = "The ID of the storage account."
}

output "sorage_account_name" {
  value       = module.storageacc.sorage_account_name
  description = "The name of the storage account."
}

output "storage_primary_connection_string" {
  value       = module.storageacc.storage_primary_connection_string
  description = "The primary connection string for the storage account."
}

output "storage_primary_access_key" {
  value       = module.storageacc.storage_primary_access_key
  description = "The primary access key for the storage account."
}

output "containers" {
  value = module.storageacc.containers
  description = "Map of containers."
}

output "file_shares" {
  value = module.storageacc.file_shares
  description = "storage SMB file shares list"
}

