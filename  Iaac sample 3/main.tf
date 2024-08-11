terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.106.1"
    }
  }
  # backend "azurerm" {} # Backend variables are initialized through the secret and variable folders
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

variable "environments" {
  description = "List of environments"
  type        = list(string)
  default     = ["dev", "staging", "production"]
}

resource "azurerm_resource_group" "project1_rg" {
  for_each = toset(var.environments)
  name     = "project1_rg_${each.key}"
  location = "East US"
  tags = {
    environment = each.key
  }
}