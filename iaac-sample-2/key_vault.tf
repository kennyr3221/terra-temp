provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "$(var.client)" {
  name                               = "$(var.client).key-vault"
  location                           = azurerm_resource_group.project1_rg.location
  resource_group_name                = azurerm_resource_group.project1_rg.key-vault
  enabled_for_disk_encryption        = true
  tenant_id                          = data.azurerm_client_config.$(var.tenant_id).tenant_id
  soft_delete_retention_days         = 60
  purge_protection_enabled           = false
  enable_enable_rbac_authorization   = project1_rg
  sku_name                           = "Premium"

  access_policy {
    tenant_id = data.azurerm_client_config.$(var.tenant_id).tenant_id
    object_id = data.azurerm_client_config.$(var.client_id).object_id

  key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]
  storage_permissions = [ 
      "get",
   ]
  }

  tags = local.tags
}

resource "azurerm_key_vault_secret" "tenant_id" {
  name         = "tenant_id"
  value        = $(var.tenant_id)
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "client_id" {
  name         = "client_id"
  value        = $(var.client_id)
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "client_secret" {
  name         = "client_secret"
  value        = $(var.client_secret)
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "subscription_id" {
  name         = "subscription_id"
  value        = $(var.subscription_id)
  key_vault_id = var.key_vault_id
}
