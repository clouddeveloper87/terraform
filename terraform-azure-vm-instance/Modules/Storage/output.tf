output "sa_name" {
  value = azurerm_storage_account.storageacct.name
}

output "sa_primary_endpoint" {
  value = azurerm_storage_account.storageacct.primary_web_endpoint
}

output "sa_primary_access_key" {
  value = azurerm_storage_account.storageacct.primary_access_key
}

output "identity" {
  value = azurerm_storage_account.storageacct.identity
}

output "id" {
  value = azurerm_storage_account.storageacct.id
}

output "primary_blob_endpoint" {
  value       = azurerm_storage_account.storageacct.primary_blob_endpoint
  description = "The endpoint URL for blob storage in the primary location."
}
