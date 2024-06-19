
resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    private_ip_address            = each.value.ip
  }


}

# resource "azurerm_network_interface_application_security_group_association" "vm_asg" {
#   for_each            = var.nic
#   application_security_group_id = var.asg_id
#   #ip_configuration_name         = azurerm_network_interface.nic.ip_configuration[0].name
#   network_interface_id          = azurerm_network_interface.nic[each.key].id
# }

# To Associate NIC with Backend pool of the LB - Applies for SQL Server on VM HA
# resource "azurerm_network_interface_backend_address_pool_association" "beap_assoc" {
#   # count = length(var.backend_address_pool_ids) == 0 ? 0 : 1
#   for_each                = { for k, v in var.backend_address_pool_ids : k => v if length(var.backend_address_pool_ids) > 0 }
#   network_interface_id    = azurerm_network_interface.nic[tostring(each.value.nic_key)].id
#   ip_configuration_name   = azurerm_network_interface.nic[tostring(each.value.nic_key)].ip_configuration[0].name
#   backend_address_pool_id = each.value.id
# }

resource "azurerm_managed_disk" "datadisk" {
  
  name                          = "datadisk"
  location                      = var.location
  resource_group_name           = var.rg_name
  storage_account_type          = "Standard_LRS"
  zone                          = var.availability_zone
  create_option                 = "Empty"
  disk_size_gb                  = "1"
  public_network_access_enabled = var.data_disk_public_access_enabled
  network_access_policy         = var.data_disk_public_access_enabled == true ? "AllowAll" : "DenyAll"
}


resource "azurerm_virtual_machine_data_disk_attachment" "dd_attach" {
  
  managed_disk_id    = azurerm_managed_disk.datadisk.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm.id
  lun                = "10"
  caching            = "ReadWrite"
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                  = "vm-testing"
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [for i, x in var.nic : azurerm_network_interface.nic[i].id]
  size                  = var.vm_size
  zone                  = var.availability_zone
  admin_username        = var.admin_user
  admin_password        = var.admin_password
  license_type          = "Windows_Server"
  # source_image_id       = var.is_sqlservervm == true ? null : var.vm_image_id
  source_image_reference{
     
      publisher = var.publisher
      offer     = var.offer
      sku       = var.sku
      version   = var.image_version
    
  }


  os_disk {
    name                 = "os-vms"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
    disk_size_gb         = var.os_disk_size
  }

  identity {
    type = "SystemAssigned"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_storage
  }

  
}

# resource "azurerm_backup_protected_vm" "vm_backup" {
#   backup_policy_id    = var.backup_policy_id
#   recovery_vault_name = var.recovery_vault_name
#   resource_group_name = var.mgmt_rg
#   source_vm_id        = azurerm_windows_virtual_machine.vm.id

#   depends_on = [azurerm_windows_virtual_machine.vm]
# }

# resource "azurerm_dev_test_global_vm_shutdown_schedule" "autoshutdown" {
#   virtual_machine_id = azurerm_windows_virtual_machine.vm.id
#   location           = var.location
#   enabled            = true

#   daily_recurrence_time = var.daily_recurrence_time
#   timezone              = var.timezone

#   notification_settings {
#     enabled = false
#   }
# }

# data "azurerm_monitor_diagnostic_categories" "nic_diagnostics_settings" {
#   resource_id = values(azurerm_network_interface.nic)[0].id
# }

# resource "azurerm_monitor_diagnostic_setting" "monitor-vm-nic" {
#   for_each                   = var.nic
#   name                       ="monitoring-vm"
#   target_resource_id         = azurerm_network_interface.nic[each.key].id
#   log_analytics_workspace_id = var.log_workspace_id
#   storage_account_id         = var.storage_account_logs

#   dynamic "enabled_log" {
#     iterator = log_category
#     for_each = data.azurerm_monitor_diagnostic_categories.nic_diagnostics_settings.log_category_types

#     content {
#       category = log_category.value
#     }
#   }

#   dynamic "metric" {
#     iterator = metrics
#     for_each = data.azurerm_monitor_diagnostic_categories.nic_diagnostics_settings.metrics

#     content {
#       category = metrics.value
#     }
#   }
# }


# resource "azurerm_monitor_data_collection_rule_association" "dcr-association" {
#   count = length(var.data_collection_rule_id)
#   name                    = "dcr-ass"
#   target_resource_id      = azurerm_windows_virtual_machine.vm.id
#   data_collection_rule_id = var.data_collection_rule_id[count.index]
#   description             = "Data Collection rule for windows machine"
# }

# # associate to a Data Collection Endpoint
# resource "azurerm_monitor_data_collection_rule_association" "dce-assocation" {
#   target_resource_id          = azurerm_windows_virtual_machine.vm.id
#   data_collection_endpoint_id = var.data_collection_endpoint_id
#   description                 = "Data collection endpoint for windows machine"
# }

# resource "azurerm_virtual_machine_extension" "AMA" {
#   name                 = "AzureMonitorWindowsAgent"
#   virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
#   publisher            = "Microsoft.Azure.Monitor"
#   type                 = "AzureMonitorWindowsAgent"
#   type_handler_version = "1.2"
#   automatic_upgrade_enabled = true
# }



# resource "azurerm_virtual_machine_extension" "DAAgent" {
#   name                       = "DAAgentExtension"
#   virtual_machine_id         = azurerm_windows_virtual_machine.vm.id
#   publisher                  = "Microsoft.Azure.Monitoring.DependencyAgent"
#   type                       = "DependencyAgentWindows"
#   type_handler_version       = "9.10"
#   auto_upgrade_minor_version = true
#   automatic_upgrade_enabled = true

# }

