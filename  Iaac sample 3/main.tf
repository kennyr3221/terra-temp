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


locals {
  # Define a local value 'name_suffix' that combines the 'project' and 'environment' values
  # from the 'resource_tags' variable. This creates a unique suffix for resource names.
  name_suffix = "${var.resource_tags["project"]}-${var.resource_tags["environment"]}"

  # Define a local value 'tags' that selects the appropriate set of tags based on the current
  # environment. It uses a map lookup where the keys are environment names ('dev', 'staging', 'prod'),
  # and the values are the corresponding tag maps (var.tags_dev, var.tags_staging, var.tags_prod).
  tags = {
    dev     = var.tags_dev,
    testing = var.tags_testing,
    staging = var.tags_staging,
    prod    = var.tags_production
  }[var.resource_tags["environment"]]
}
