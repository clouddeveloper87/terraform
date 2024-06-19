# variable "agency" {
#   description = "3-letter code for Agency name"
# }

# # Variable for project_code
# variable "project_code" {
#   description = "project code"
# }

# variable "env" {
#   description = "environment. Staging, UAT, SIT, QA, Prod represented by stg, uat, sit, qa, prd respectively."
# }

# variable "zone" {
#   description = "Internet zone, Intranet Zone, Management Zone represented by ez, iz and mz respectively."
# }

# variable "tier" {
#   description = "Network tiers - Web, App, DB, GUT, IT"
# }

variable "location" {
  description = "Singapore region"
}

variable "rg_name" {
  description = "Resource Group Name"
}

variable "app_name" {
  description = "Application Name"
}

variable "vm_size" {
  description = "Specifies the size of the Virtual Machine."
}

variable "subnet_id" {
  description = "ID of the subnet in which the VM is created in"
  type = string
  default="subnet1"
}
# variable "vm_image_id" {
#   description = "ID of the VM image"
# }

variable "hostname" {
  description = "Hostname of VM"
}

variable "admin_user" {
  description = "OS Administrator Username"
}

variable "admin_password" {
  description = "OS Administratior Password"
}

variable "asg_id" {
  description = "ID of the App Security Group to apply to the VM"
}

variable "user_data_base64" {
  type        = string
  description = "The Base64-encoded user data to provide when launching the instances"
  default     = ""
}

variable "os_disk_size" {
  description = "OS Disk size"
}

variable "description" {
  description = "Description of the VM"
}

variable "availability_zone" {
  description = "Availability Zone for Application Gateway"
}

variable "boot_storage" {
  description = "Storgae Account for boot diagnostics"
}
/*
#---------------------------------------------------
#Active Directory settings
#---------------------------------------------------
variable "active_directory_domain" {
  description = "Windows Domain name"
}

variable "active_directory_user" {
  description = "AD Domain Administrator Username"
}

variable "active_directory_password" {
  description = "AD Domain Administrator password"
}

variable "active_directory_ou_path" {
  description = "Servers will be put under the OU"
}
*/
#---------------------------------------------------
# Backup settings
#---------------------------------------------------
# variable "mgmt_rg" {
#   description = "Name of Resource Group used for System Mgmt"
# }

# variable "backup_policy_id" {
#   description = "Specifies the id of the backup policy to use"
# }

# variable "recovery_vault_name" {
#   description = "Specifies the name of the Recovery Services Vault to use. Changing this forces a new resource to be created."
# }
/*
#---------------------------------------------------
# Monitor settings
#---------------------------------------------------
variable "metric_cpu_threshold" {
  description = "CPU threshold. Email alerts to be sent once the threshold is crossed."
}

variable "notification_emails" {
  type = list(string)
  description = "Email alerts will be sent to the recipients once the thresholds are breached."
}
*/
#---------------------------------------------------
# DIAGNOSTIC SETTINGS
#---------------------------------------------------
variable "log_workspace_id" {
  description = "Log Analytics Workspace id for Diagnostic settings"
}

variable "storage_account_logs" {
  description = "Storage Account Name to store logs"
}

#---------------------------------------------------
# Managed Disk
#---------------------------------------------------
variable "data_disk" {
  type        = map(any)
  description = "Data Disk configuration"
}
variable "nic" {
  type        = map(any)
  description = "Data Disk configuration"
}
variable "data_disk_public_access_enabled" {
  type        = bool
  description = "Public access for Data Disk"
}

#---------------------------------------------------
# VM EXTENSIONS
#---------------------------------------------------
# variable "log_workspace_key" {
#   description = "Log Analytics Workspace key for Azure Monitor Agent"
# }

# variable "data_collection_rule_id" {
  
#   description = "Data collection rule id"
# }
# variable "data_collection_endpoint_id" {
#   description = "Data collection endpoint id"
# }
variable "log_workspace_name" {
  description = "Log Analytics Workspace key for Azure Monitor Agent"
}

#----------------------------------------------------
# Auto Shutdown Schedule
#----------------------------------------------------

variable "daily_recurrence_time" {
  description = "Daily recurrence time"
}

variable "timezone" {
  description = "time zone of the shutdown"
}

#----------------------------------------------------
# SQL Serve settings
#----------------------------------------------------
# variable "is_sqlservervm" {
#   type        = bool
#   default     = false
#   description = "Set this variable to 'true' if the creating SQL Server on Windows VM"
# }

# variable "backend_address_pool_ids" {
#   type = list(object({
#     id      = string
#     nic_key = string
#   }))
#   default     = []
#   description = "Backend address pool id of LB used for SQL Server HA"
# }

variable "publisher" {
  type        = string
  default     = "MicrosoftWindowsServer"
  description = "Publisher of the VM image"
}
variable "sku" {
  type        = string
  default     = "2022-Datacenter"
  description = "Publisher of the VM image"
}
variable "offer" {
  type        = string
  default     = "WindowsServer"
  description = "offer of the VM image"
}
variable "image_version" {
  type        = string
  default     = "latest"
  description = "version of the VM image"
}

# variable "law_primary_shared_key" {
#   description = "Log Analytics Workspace Primary Shared Key"
#   type        = string
# }

variable "nicname"{
 type        = string
  default     = "nic-nsme"
  description = "names"

}

# variable "dataname"{
#   description = "dataname"
# }

# variable "vmsname"{
#   description = "vmsname"
# }

# variable "osname"{
#   description = "vmsname"
# }