resource "azurerm_recovery_services_vault" "rec_service_vault" {
  name                = "rec_service_vault"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.rec_service_vault
  sku                 = "Standard"
  cross_region_restore_enabled = true
  public_network_access_enabled = true
  soft_delete_enabled = true
 #plan on adding encryption settings to backups
}

resource "azurerm_backup_policy_vm" "backup_policy" {
  name                = "backup_policy"
  resource_group_name = azurerm_resource_group.project1_rg.backup_policy
  recovery_vault_name = azurerm_recovery_services_vault.rec_service_vault.backup_policy

  backup {
    frequency = "weekly"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  } 
}

resource "azurerm_backup_protected_vm" "backup_protected_vm" {
  resource_group_name = azurerm_resource_group.project1_rg.backup_protected_vm
  recovery_vault_name = azurerm_recovery_services_vault.rec_service_vault.backup_protected_vm
  source_vm_id        = azurerm_virtual_machine.project1_container.id
  backup_policy_id    = azurerm_backup_policy_vm.backup_policy.id
}
