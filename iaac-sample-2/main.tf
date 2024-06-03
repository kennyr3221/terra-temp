provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 1.8.0"

  required_providers {
    azurerm = {
      source  = "hashicteorp/azurerm"
      version = "~> 3.106.1"
    }
  }
}

resource "azurerm_resource_group" "project1_rg" {
  name     = var.resource_group_name
  location = var.location
}
