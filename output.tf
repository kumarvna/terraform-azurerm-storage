output "storage_account_id" {
  value       = azurerm_storage_account.storeacc.id
  description = "The ID of the storage account."
}

output "sorage_account_name" {
  value       = azurerm_storage_account.storeacc.name
  description = "The name of the storage account."
}

output "storage_primary_connection_string" {
  value       = azurerm_storage_account.storeacc.primary_connection_string
  description = "The primary connection string for the storage account."
}

output "storage_primary_access_key" {
  value       = azurerm_storage_account.storeacc.primary_access_key
  description = "The primary access key for the storage account."
}

output "containers" {
  value = {
    for c in azurerm_storage_container.container :
    c.name => {
      id   = c.id
      name = c.name
    }
  }
  description = "Map of containers."
}

output "file_shares" {
  value = { for f in azurerm_storage_share.fileshare :
    f.name => {
      id   = f.id
      name = f.name
    }
  }
  description = "Map of Storage SMB file shares."
}
