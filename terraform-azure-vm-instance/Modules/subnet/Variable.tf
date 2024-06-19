variable "resource_group_name" {
  description = "Name of the resource group where the subnet will be created."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network where the subnet will be created."
  type        = string
}

variable "subnet_name" {
  description = "List of subnet names to be created."
  type        = string
}

variable "address_prefixes" {
  description = "List of address prefixes for the subnets."
  type        = list(string)
}
