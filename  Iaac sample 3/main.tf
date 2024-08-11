terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.106.1"
    }
  }
  backend "azurerm" {} #Backend variables are initialized through the secret and variable folders
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

resource "azurerm_resource_group" "project1_rg" {
  name     = "project1_rg"
  location = "East US"
  tags     = {
    environment = "dev"
    environment = "staging" 
    environment = "production"
  }
}
