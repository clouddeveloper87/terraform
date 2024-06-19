data "azurerm_resource_group" "RG" {
  name = "HassanRG"
}


resource "azurerm_storage_container" "container" {
  name                  = var.container_name
#   resource_group_name   = data.azurerm_resource_group.RG.Name
  storage_account_name  = var.sa_name
  container_access_type = "private"
}