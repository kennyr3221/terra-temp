resource "azurerm_sql_server" "project1_sql_server" {
  name                         = "project1_sql_server"
  resource_group_name          = azurerm_resource_group.project1_rg.project1_sql_server
  location                     = azurerm_resource_group.project1_rg.location
  version                      = "12.0"
  administrator_login          = "$(var.sql_admin_user)"
  administrator_login_password = "$(var.sql_admin_password)"
}
