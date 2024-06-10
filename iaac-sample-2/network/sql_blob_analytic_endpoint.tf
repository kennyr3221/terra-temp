resource "azurerm_private_endpoint" "project1_blob_pe" {
  name                = "project1_blob_pe"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.project1_blob_pe
  subnet_id           = azurerm_subnet.project1_subnet.id

  private_service_connection {
    name                           = "blobConnection"
    private_connection_resource_id = azurerm_storage_account.project1_storage.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}

resource "azurerm_private_endpoint" "project1_sql_pe" {
  name                = "project1-sql-pe"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.project1_sql_pe
  subnet_id           = azurerm_subnet.project1_subnet.id

  private_service_connection {
    name                           = "sqlConnection"
    private_connection_resource_id = azurerm_sql_server.project1_sql_server.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}

resource "azurerm_private_endpoint" "project1_synapse_pe" {
  name                = "project1-synapse-pe"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.project1_synapse_pe
  subnet_id           = azurerm_subnet.project1_subnet.id

  private_service_connection {
    name                           = "synapseConnection"
    private_connection_resource_id = azurerm_synapse_workspace.project1_synapse.id
    is_manual_connection           = false
    subresource_names              = ["sql", "sqlOnDemand"]
  }
}
