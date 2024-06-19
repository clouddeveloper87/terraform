resource "azurerm_log_analytics_workspace" "log_workspace" {
  location            = var.location
  name                = "logworkspace"
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_period


}

resource "azurerm_log_analytics_solution" "container_insights" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.log_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_log_analytics_solution" "service_map" {
  solution_name         = "ServiceMap"
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.log_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ServiceMap"
  }
}

resource "azurerm_log_analytics_solution" "security" {
  solution_name         = "Security"
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.log_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Security"
  }
}

resource "azurerm_log_analytics_solution" "infra_insight" {
  solution_name         = "InfrastructureInsights"
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.log_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/InfrastructureInsights"
  }
}

resource "azurerm_log_analytics_solution" "vminsights" {
  solution_name         = "vminsights"  
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.log_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.log_workspace.name
  plan {    
    publisher = "Microsoft"   
    product   = "OMSGallery/VMInsights"  
    }
}