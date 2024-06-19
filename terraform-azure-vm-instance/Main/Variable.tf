variable "location" {
  default     = "Southeast Asia"
  description = "Singapore region"
}


variable "app_vm_app_name" {
  default="vmsapp"
  type = string
  description = "Name of the application used in App Server"
}
variable "admin_user" {
    default="userapp"
  type = string
  description = "Name of the VM Admin User"
}

variable "admin_password" {
     default="P@$$w0rd1234!"
  type = string
  description = "OS Administratior Password"
}
# variable "app_nic" {
#   type        = map(any)
#   description = "description"
# }

variable "availability_zone" { 
  default     = "1"
  type        = string
  description = "description"
}

variable "app_dd" { 
   type = map(any)
  description = "description"
}



variable "app_hostname" {
    default="oszuiapp01"
  type        = string
  description = "description"
}

# variable "app_availability_zone" {
#   type        = string
#   description = "Availability Zone of App server"
# }

variable "app_image_publisher" {
  type = string
  default     = "MicrosoftWindowsServer"
  description = "Publisher of the VM image"
}
variable "app_image_sku" {
  type = string
  default     = "2022-Datacenter"
  description = "Image SKU of the VM image"
}
variable "app_image_offer" {
  type = string
   default     = "WindowsServer"
  description = "offer of the VM image"
}
variable "app_image_version" {
  type = string
   default     = "latest"
  description = "version of the VM image"
}

variable "app_os_disk_size" {
    default="256"
  type = string
  description = "OS Disk Size of App Server"
}

variable "app_vm_size" {
  default = "Standard_D2s_v3"
  type = string
  description = "VM Size of the App Server"
}



variable "nicname" {
  type = map(object({
    app_name = string
    ip       = string
  }))
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

variable "sa_name" {
  description = "Storage Account name"
  default="storageacctvmss"
}

# variable "container_name" {
#   description = "Name of the Storage Container"
# }
