variable "resource_group_name" {
  description = "Name of the resource group where the VNET will be created."
  type        = string
}

variable "location" {
  description = "Azure region where the VNET will be located."
  type        = string
}

variable "vnet_names" {
  description = "Names of the VNETs to be created."
  type        = list(string)
}

variable "address_spaces" {
  description = "Address spaces for the VNETs."
  type        = list(string)
}
