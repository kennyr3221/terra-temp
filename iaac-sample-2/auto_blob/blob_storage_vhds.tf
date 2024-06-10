resource "azurerm_storage_account" "project1_storage" {
  name                     = "storage${local.name_suffix}"
  resource_group_name      = azurerm_resource_group.project1_rg.name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  tags                    = local.tags
}
resource "azurerm_storage_container" "project1_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.project1_storage.name
  container_access_type = var.container_access_type
}