resource "azurerm_storage_account" "storageacct" {
  account_replication_type          = "LRS"
  account_tier                      = "Standard"
  account_kind                      = "StorageV2"
  location                          = var.location
  name                              = "storageacctvmss"
  resource_group_name               = var.rg_name
  min_tls_version                   = "TLS1_2"
  public_network_access_enabled     = "false"
  infrastructure_encryption_enabled = "true"
  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_monitor_diagnostic_setting" "storage_acct_logs" {
  name                       = "monitor-storage-account-logs"
  target_resource_id         = azurerm_storage_account.storageacct.id
  log_analytics_workspace_id = var.log_workspace_id
  storage_account_id         = var.storage_account_logs

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric, target_resource_id]
  }
}

resource "azurerm_monitor_diagnostic_setting" "storage_blob_logs" {
  name                       = "monitor-storage-blob-logs"
  target_resource_id         = "${azurerm_storage_account.storageacct.id}/blobServices/default"
  log_analytics_workspace_id = var.log_workspace_id
  storage_account_id         = var.storage_account_logs

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric, log, target_resource_id]
  }
}

resource "azurerm_monitor_diagnostic_setting" "storage_file_logs" {
  name                       = "monitor-storage-file-logs"
  target_resource_id         = "${azurerm_storage_account.storageacct.id}/fileServices/default"
  log_analytics_workspace_id = var.log_workspace_id
  storage_account_id         = var.storage_account_logs

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric, log, target_resource_id]
  }
}

resource "azurerm_monitor_diagnostic_setting" "storage_queue_logs" {
  name                       = "monitor-storagequeue-logs"
  target_resource_id         = "${azurerm_storage_account.storageacct.id}/queueServices/default"
  log_analytics_workspace_id = var.log_workspace_id
  storage_account_id         = var.storage_account_logs

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric, log, target_resource_id]
  }
}

resource "azurerm_monitor_diagnostic_setting" "storage_table_logs" {
  name                       = "monitor-storage-table-logs"
  target_resource_id         = "${azurerm_storage_account.storageacct.id}/tableServices/default"
  log_analytics_workspace_id = var.log_workspace_id
  storage_account_id         = var.storage_account_logs

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric, log, target_resource_id]
  }
}