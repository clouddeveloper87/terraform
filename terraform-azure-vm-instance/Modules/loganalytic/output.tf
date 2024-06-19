output "log_workspace_id" {
  value = azurerm_log_analytics_workspace.log_workspace.id
}
output "log_analytics_workspace_primary_shared_key" {
  value       = azurerm_log_analytics_workspace.log_workspace.primary_shared_key
  description = "Specifies the workspace key of the log analytics workspace"
  sensitive   = true
}
output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.log_workspace.name
}