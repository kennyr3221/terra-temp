resource "azurerm_key_vault" "example" {
  name                        = "examplekeyvault"
  location                    = azurerm_resource_group.project1_rg.location
  resource_group_name         = azurerm_resource_group.project1_rg.name
  tenant_id                   = data.azurerm_client_config.example.tenant_id
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.example.tenant_id
    object_id = data.azurerm_client_config.example.object_id

    secret_permissions = [
      "Get",
    ]
  }

  tags = local.tags
}

resource "azurerm_key_vault_secret" "sp_client_id" {
  name         = "sp-client-id"
  value        = "your-client-id"
  key_vault_id = azurerm_key_vault.example.id
}

resource "azurerm_key_vault_secret" "sp_client_secret" {
  name         = "sp-client-secret"
  value        = "your-client-secret"
  key_vault_id = azurerm_key_vault.example.id
}

resource "azurerm_key_vault_secret" "sp_tenant_id" {
  name         = "sp-tenant-id"
  value        = "your-tenant-id"
  key_vault_id = azurerm_key_vault.example.id
}
