resource "azurerm_storage_account" "project1_storage" {
  name                     = "project1storage"
  resource_group_name      = azurerm_resource_group.project1_rg.name
  location                 = azurerm_resource_group.project1_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "project1_container" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.project1_storage.name
  container_access_type = "private"
}
