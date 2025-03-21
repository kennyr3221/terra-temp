# variables.tf
variable "environment" {
  description = "The environment for which the resources are being created."
  type        = string
  default     = "production"
}

variable "tags_production" {
  description = "A map of tags to be assigned to the production resources."
  type        = map(string)
  default = {
    environment = "production"
    project     = "project1"
  }
}

variable "tags_testing" {
  description = "A map of tags to be assigned to the testing resources."
  type        = map(string)
  default = {
    environment = "testing"
    project     = "project1"
  }
}

variable "name" {
  description = "name of the resource"
  type        = string
  default     = "null"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "project1-vnet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "project1-subnet"
}

variable "subnet_prefix" {
  description = "The address prefix for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
  default     = "project1-nsg"
}

variable "vmss_name" {
  description = "The name of the VM scale set"
  type        = string
  default     = "project1-vmss"
}

variable "vmss_instance_count" {
  description = "The initial number of instances in the VM scale set"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "The size of the virtual machines"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for the virtual machines"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the virtual machines"
  type        = string
  default     = "P@ssword1234!"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "null.project1storage"
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "vhds"
}

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
  default     = "project1-sql-server"
}

variable "sql_database_name" {
  description = "The name of the SQL database"
  type        = string
  default     = "project1sqldb"
}

variable "sql_admin_username" {
  description = "Admin username for the SQL server"
  type        = string
  default     = "adminuser"
}

variable "sql_admin_password" {
  description = "Admin password for the SQL server"
  type        = string
  default     = "P@ssword1234!"
}

variable "synapse_workspace_name" {
  description = "The name of the Synapse workspace"
  type        = string
  default     = "project1synapse"
}

variable "synapse_sql_admin_username" {
  description = "Admin username for Synapse"
  type        = string
  default     = "sqladmin"
}

variable "synapse_sql_admin_password" {
  description = "Admin password for Synapse"
  type        = string
  default     = "P@ssword1234!"
}

variable "bastion_name" {
  description = "The name of the bastion host"
  type        = string
  default     = "project1-bastion"
}

variable "lb_name" {
  description = "The name of the load balancer"
  type        = string
  default     = "project1-lb"
}

variable "frontend_ip_config_name" {
  description = "The name of the frontend IP configuration"
  type        = string
  default     = "project1-fe-config"
}

variable "backend_pool_name" {
  description = "The name of the backend pool"
  type        = string
  default     = "project1_lb_pool"
}

variable "probe_name" {
  description = "The name of the health probe"
  type        = string
  default     = "project1_lb_probe"
}

variable "lb_rule_name" {
  description = "The name of the load balancing rule"
  type        = string
  default     = "project1_lb_rule"
}

variable "vnet_peering_name" {
  description = "The name of the VNet peering"
  type        = string
  default     = "project1-vnet-peering"
}

variable "vpn_gateway_name" {
  description = "The name of the VPN gateway"
  type        = string
  default     = "project1-vpn-gateway"
}

variable "vpn_public_ip_name" {
  description = "The name of the VPN gateway public IP"
  type        = string
  default     = "project1-vpn-ip"
}

variable "firewall_name" {
  description = "The name of the firewall"
  type        = string
  default     = "project1-firewall"
}

variable "firewall_public_ip_name" {
  description = "The name of the firewall public IP"
  type        = string
  default     = "project1-firewall-ip"
}

variable "vm_zone1_name" {
  description = "The name of the VM in zone 1"
  type        = string
  default     = "project1-vm-zone1"
}

variable "vm_zone2_name" {
  description = "The name of the VM in zone 2"
  type        = string
  default     = "project1-vm-zone2"
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
  default     = (null)

( variable "zone1_location" {
  description = "Location for zone 1 VM"
  type        = string
  default     = "East US 2"
}

variable "zone2_location" {
  description = "Location for zone 2 VM"
  type        = string
  default     = "West US 2"
 })
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
  default     = "backupstorageaccount"
}

variable "storage_account_tier" {
  description = "The tier of the storage account."
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "The replication type of the storage account."
  type        = string
  default     = "LRS"
}

variable "storage_container_name" {
  description = "The name of the storage container."
  type        = string
  default     = "backups"
}

variable "resource_group_name" {
  description = "The name of the resource group in which the storage account will be created."
  type        = string
  default     = (null)
}

variable "tenant_id" {
  description = "The tenant ID to be stored in the Key Vault."
  type        = string
}

variable "client_id" {
  description = "The client ID to be stored in the Key Vault."
  type        = string
}

variable "client_secret" {
  description = "The client secret to be stored in the Key Vault."
  type        = string
}

variable "subscription_id" {
  description = "The subscription ID to be stored in the Key Vault."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault where secrets will be stored."
  type        = string
}
