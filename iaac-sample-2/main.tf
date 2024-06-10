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

resource "azurerm_resource_group" "project1_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

