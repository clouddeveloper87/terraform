#Import Resource Group
data "azurerm_resource_group" "RG" {
  name = "HassanRG"
}

#Vnet
resource "azurerm_virtual_network" "vnet" {
  count               = length(var.vnet_names)
  name                = var.vnet_names[count.index]
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.address_spaces[count.index]]
}


