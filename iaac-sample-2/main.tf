provider "azurerm" {
  features {}

terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_resource_group" "project1_rg" {
  name     = "project1-resource-group"
  location = "East US"
}