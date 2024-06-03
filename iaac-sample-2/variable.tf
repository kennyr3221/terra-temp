# Variables for Project 1

# General settings
variable "location" {
  description = "The Azure region to deploy resources in"
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "project1-resource-group"
}

# Virtual Network and Subnets
variable "vnet_name" {
  description = "The name of the virtual network"
  default     = "project1-vnet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  default     = "project1-subnet"
}

variable "subnet_prefix" {
  description = "The address prefix for the subnet"
  default     = "10.0.1.0/24"
}

variable "gateway_subnet_name" {
  description = "The name of the gateway subnet"
  default     = "gateway-subnet"
}

variable "firewall_subnet_name" {
  description = "The name of the firewall subnet"
  default     = "firewall-subnet"
}

# Network Security Group
variable "nsg_name" {
  description = "The name of the network security group"
  default     = "project1-nsg"
}

# VM Scale Set
variable "vmss_name" {
  description = "The name of the VM scale set"
  default     = "project1-vmss"
}

variable "vmss_instance_count" {
  description = "The initial number of instances in the VM scale set"
  default     = 2
}

variable "vm_size" {
  description = "The size of the virtual machines"
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for the virtual machines"
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the virtual machines"
  default     = "P@ssword1234!"
}

# Blob Storage
variable "storage_account_name" {
  description = "The name of the storage account"
  default     = "project1storage"
}

variable "container_name" {
  description = "The name of the storage container"
  default     = "vhds"
}

# SQL Database
variable "sql_server_name" {
  description = "The name of the SQL server"
  default     = "project1sqlserver"
}

variable "sql_database_name" {
  description = "The name of the SQL database"
  default     = "project1sqldb"
}

variable "sql_admin_username" {
  description = "Admin username for the SQL server"
  default     = "adminuser"
}

variable "sql_admin_password" {
  description = "Admin password for the SQL server"
  default     = "P@ssword1234!"
}

# Data Analytics (Azure Synapse)
variable "synapse_workspace_name" {
  description = "The name of the Synapse workspace"
  default     = "project1synapse"
}

variable "synapse_sql_admin_username" {
  description = "Admin username for Synapse"
  default     = "sqladmin"
}

variable "synapse_sql_admin_password" {
  description = "Admin password for Synapse"
  default     = "P@ssword1234!"
}

# Bastion Host
variable "bastion_name" {
  description = "The name of the bastion host"
  default     = "project1-bastion"
}

# Load Balancer
variable "lb_name" {
  description = "The name of the load balancer"
  default     = "project1-lb"
}

variable "frontend_ip_config_name" {
  description = "The name of the frontend IP configuration"
  default     = "project1-fe-config"
}

variable "backend_pool_name" {
  description = "The name of the backend pool"
  default     = "project1_lb_pool"
}

variable "probe_name" {
  description = "The name of the health probe"
  default     = "project1_lb_probe"
}

variable "lb_rule_name" {
  description = "The name of the load balancing rule"
  default     = "project1_lb_rule"
}

# VNet Peering
variable "vnet_peering_name" {
  description = "The name of the VNet peering"
  default     = "project1-vnet-peering"
}

# VPN Gateway
variable "vpn_gateway_name" {
  description = "The name of the VPN gateway"
  default     = "project1-vpn-gateway"
}

variable "vpn_public_ip_name" {
  description = "The name of the VPN gateway public IP"
  default     = "project1-vpn-ip"
}

# Firewall
variable "firewall_name" {
  description = "The name of the firewall"
  default     = "project1-firewall"
}

variable "firewall_public_ip_name" {
  description = "The name of the firewall public IP"
  default     = "project1-firewall-ip"
}

# Separate VMs Across Zones and Regions
variable "vm_zone1_name" {
  description = "The name of the VM in zone 1"
  default     = "project1-vm-zone1"
}

variable "vm_zone2_name" {
  description = "The name of the VM in zone 2"
  default     = "project1-vm-zone2"
}

variable "zone1_location" {
  description = "Location for zone 1 VM"
  default     = "East US 2"
}

variable "zone2_location" {
  description = "Location for zone 2 VM"
  default     = "West US 2"
}
