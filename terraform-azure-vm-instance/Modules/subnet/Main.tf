#Import Resource Group
data "azurerm_resource_group" "RG" {
  name = "HassanRG"
}

resource "azurerm_subnet" "subnet" {
  # count                = var.subnet_name
  name                 = var.subnet_name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes       = var.address_prefixes
}

