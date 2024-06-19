
variable "location" {
  
  description = "Singapore region"
}
variable "rg_name" {
  description = "Resource group name. The Storage Account will be created within this resource group"
}

variable "log_workspace_id" {
  description = "Log Analytics Workspace ID"
}

variable "storage_account_logs" {
  description = "Storage Account Name to store logs"
  default     = null
}