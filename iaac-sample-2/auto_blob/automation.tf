resource "azurerm_automation_account" "auto_account" {
  name                          = "auto_account"
  location                      = azurerm_resource_group.project1_rg.project1
  resource_group_name           = azurerm_resource_group.project1_rg.auto_account
  sku_name = "Basic"
  local_authentication_enabled  = true
  public_network_access_enabled = false
}
resource "azurerm_automation_schedule" "auto_schedule" {
  name                    = "auto_schedule"
  resource_group_name     = azurerm_resource_group.project1_rg.auto_schedule
  automation_account_name = azurerm_automation_account.auto_schedule.auto_account
  frequency               = "Day"
  interval                = 5
  timezone                = "UTC"
  start_time              = "2023-01-01T02:00:00Z"
}

resource "azurerm_automation_job_schedule" "auto_job_sched" {
  automation_account_name = azurerm_automation_account.auto_account.auto_job_sched
  resource_group_name     = azurerm_resource_group.project1_rg.project1_rg
  runbook_name            = azurerm_automation_runbook.auto_job_sched.backup_runbook
  schedule_name           = azurerm_automation_schedule.auto_schedule.auto_job_sched
  parameters = {
    ResourceGroupName = azurerm_resource_group.project1_rg.project1_rg
    StorageAccountName = azurerm_storage_account.backup_storage.project1_storage
    ContainerName = azurerm_storage_container.backup_container.project1_container
    VmName = "your-vm-name"
    Location = "East US"
    KeyVaultName = azurerm_key_vault.${var}.key_vault
  }
}

resource "azurerm_automation_runbook" "backup_runbook" {
  name                          = "backup_runbook"
  location                      = azurerm_automation_account.backup_runbook.project1_rg
  resource_group_name           = azurerm_resource_group.project1_rg.project1_rg
  automation_account_name       = azurerm_automation_account.backup_runbook.auto_account
  log_verbose                   = true
  log_progress                  = true
  runbook_type                  = "PowerShellWorkflow"
  content                       = <<-EOT
    workflow BackupData {
      param (
        [string] \$ResourceGroupName,
        [string] \$StorageAccountName,
        [string] \$ContainerName,
        [string] \$VmName,
        [string] \$Location,
        [string] \$KeyVaultName
      )

      # Authenticate to Azure
      \$connection = Get-AutomationConnection -Name "AzureRunAsConnection"
      \$spClientId = Get-AzureKeyVaultSecret -VaultName \$KeyVaultName -Name "sp-client-id"
      \$spClientSecret = Get-AzureKeyVaultSecret -VaultName \$KeyVaultName -Name "sp-client-secret"
      \$spTenantId = Get-AzureKeyVaultSecret -VaultName \$KeyVaultName -Name "sp-tenant-id"
      
      Add-AzureRmAccount -ServicePrincipal -TenantId \$spTenantId.SecretValueText -ApplicationId \$spClientId.SecretValueText -CertificateThumbprint \$spClientSecret.SecretValueText

      # Backup the VM
      Write-Output "Starting backup for VM: \$VmName"
      \$backupResult = Start-AzureRmVmBackup -ResourceGroupName \$ResourceGroupName -Name \$VmName
      Write-Output "Backup result: \$backupResult"

      # Copy the backup to Blob Storage
      Write-Output "Copying backup to Blob Storage: \$StorageAccountName"
      \$container = Get-AzureRmStorageContainer -ResourceGroupName \$ResourceGroupName -StorageAccountName \$StorageAccountName -Name \$ContainerName
      \$backupFiles = Get-AzureRmStorageBlob -Container \$container -Context \$container.Context
      foreach (\$file in \$backupFiles) {
        \$blobCopy = Start-AzureRmStorageBlobCopy -SrcContainer \$ContainerName -SrcBlobName \$file.Name -DestContainer \$ContainerName -DestBlobName "backup/\$file.Name" -Context \$container.Context
        Write-Output "Copied: \$blobCopy"
      }

      Write-Output "Backup process completed."
    }
  EOT
}

