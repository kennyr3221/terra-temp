terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.106.1"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 1.8.0"
}

variable "tags" {
  type    = map(string)
  default = {}
}
# Use the 'name_suffix' local value to create a unique resource group name
# Use the 'tags' local value to apply the correct set of tags based on the environment
resource "azurerm_resource_group" "project1_rg" {
  name     = "rg-${local.name_suffix}"
  location = var.location
  tags     = local.name_suffix
}

terraform { 
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.106.1"
    }
  }
}

provider "azurerm" {
  features {}
}

module "key_vault" {
  source = "./key_vault"
}

module "automation" {
  source = "./auto_blob/automation"
}

module "backup" {
  source = "./backup"
}

module "failover" {
  source = "./failover"
}

module "storage" {
  source = "./storage"
}

module "network" {
  source = "./network"
}

module "compute" {
  source = "./compute"
}

module "database" {
  source = "./database"
}

module "data_analytics" {
  source = "./data_analytics"
}

module "security" {
  source = "./security"
}

module "vpn_gateway" {
  source = "./vpn_gateway"
}

module "firewall" {
  source = "./firewall"
}

module "bastion" {
  source = "./bastion"
}

module "load_balancer" {
  source = "./load_balancer"
}

module "vnet_peering" {
  source = "./vnet_peering"
}


