resource "azurerm_backup_policy_vm" "example" {
  name                = "example-backup-policy"
  resource_group_name = azurerm_resource_group.project1_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.example.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }

  tags = local.tags
}

resource "azurerm_backup_protected_vm" "example" {
  resource_group_name = azurerm_resource_group.project1_rg.name
  recovery_vault_name = azurerm_recovery_services_vault.example.name
  source_vm_id        = azurerm_virtual_machine.example.id
  backup_policy_id    = azurerm_backup_policy_vm.example.id
}

resource "azurerm_recovery_services_vault" "example" {
  name                = "exampleRecoveryVault"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  sku                 = "Standard"

  tags = local.tags
}
