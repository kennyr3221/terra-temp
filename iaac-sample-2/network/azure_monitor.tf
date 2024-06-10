resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  name               = "Monitor_diagnostic_setting"
  target_resource_id = azurerm_virtual_network.project1_vnet.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_work.id

  workspace {
    category = "AuditEvent"
    enabled  = true
    retention {
        enabled = true
        days    = 14
    }

    metric {
    category = "AllMetrics"
    enabled  = true
    }
  }
}
resource "azurerm_log_analytics_workspace" "log_analytics_work" {
  name                = "log_analytics_work"
  resource_group_name = azurerm_resource_group.project1_rg.log_analytics_work
  location            = azurerm_resource_group.project1_rg.location
  sku                 = "Premium"
  local_authentication_disabled = true
  timeouts {
    create = "30m"
    update = "30m"
    read   = "10m"
    delete = "5m"
  }
  retention_in_days   = 30
}
