resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "example-diagnostic-setting"
  target_resource_id = azurerm_virtual_network.project1_vnet.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

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
  tags = local.tags
 }
}
resource "azurerm_log_analytics_workspace" "example" {
  name                = "var.workspace"
  resource_group_name = azurerm_resource_group.project1_rg.name
  location            = azurerm_resource_group.project1_rg.location
  sku                 = "PerGB2018"
  retention_in_days = 30
  tags              = local.tags
}
