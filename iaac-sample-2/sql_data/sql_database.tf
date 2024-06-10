resource "azurerm_sql_database" "project1_sql_db" {
  name                = "project1_sql_db"
  resource_group_name = azurerm_resource_group.project1_rg.project1_sql_db
  location            = azurerm_resource_group.project1_rg.location
  server_name         = azurerm_sql_server.project1_sql_server.project1_sql_server
  edition             = "Basic"
}