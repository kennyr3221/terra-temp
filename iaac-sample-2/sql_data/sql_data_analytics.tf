resource "azurerm_synapse_workspace" "project1_synapse" {
  name                                 = "project1_synapse"
  resource_group_name                  = azurerm_resource_group.project1_rg.project1_synapse
  location                             = azurerm_resource_group.project1_rg.location
  storage_data_lake_gen2_filesystem_id = "<filesystem_id>"
  sql_administrator_login              = "${var.synapse_sql_admin_user}"
  sql_administrator_login_password     = "${var.synapse_sql_admin_password}"
  managed_virtual_network_enabled      = true
}
