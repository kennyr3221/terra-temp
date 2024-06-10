resource "azurerm_automation_account" "example" {
  name                = "example-automation-account"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  sku {
    name = "Basic"
  }
  tags = local.tags
}

resource "azurerm_automation_runbook" "backup_runbook" {
  name                    = "backupRunbook"
  location                = azurerm_automation_account.example.location
  resource_group_name     = azurerm_resource_group.project1_rg.name
  automation_account_name = azurerm_automation_account.example.name
  log_verbose             = true
  log_progress            = true
  runbook_type            = "PowerShellWorkflow"
  content                 = <<-EOT
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

resource "azurerm_automation_schedule" "example" {
  name                    = "dailyBackupSchedule"
  resource_group_name     = azurerm_resource_group.project1_rg.name
  automation_account_name = azurerm_automation_account.example.name
  frequency               = "Day"
  interval                = 1
  timezone                = "UTC"
  start_time              = "2023-01-01T02:00:00Z"
}

resource "azurerm_automation_job_schedule" "example" {
  automation_account_name = azurerm_automation_account.example.name
  resource_group_name     = azurerm_resource_group.project1_rg.name
  runbook_name            = azurerm_automation_runbook.backup_runbook.name
  schedule_name           = azurerm_automation_schedule.example.name
  parameters = {
    ResourceGroupName = azurerm_resource_group.project1_rg.name
    StorageAccountName = azurerm_storage_account.backup_storage.name
    ContainerName = azurerm_storage_container.backup_container.name
    VmName = "your-vm-name"
    Location = "East US"
    KeyVaultName = azurerm_key_vault.example.name
  }
}
