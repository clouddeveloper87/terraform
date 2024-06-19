

variable "location" {
  description = "Singapore region"
}

variable "rg_name" {
  description = "Resource Group Name"
}

variable "retention_period" {
  default     = "30"
  description = "Log Analytics Workspace retention period in days. Possible values range between 30 and 730."
}