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
  # environment. It uses a map lookup where the keys are environment names ('production' and 'testing'),
  # and the values are the corresponding tag maps (var.tags_production and var.tags_testing).
 one required_providers block.
Incorrect required_providers syntax: The second required_providers block is incorrectly defined. It should be provider "azurerm" instead.
Duplicate environment tags: The tags block in the azurerm_resource_group resource has duplicate keys for environment. Each key in a map must be unique.
Here's the corrected version of the provided code:

Changes made:

Combined the required_providers blocks into one.
Changed the second required_providers block to provider "azurerm".
Removed duplicate environment tags in the azurerm_resource_group resource.
each.key
  tags = {
    dev     = var.tags_dev,
    staging = var.tags_staging,
    prod    = var.tags_prod
  }[var.environment]
}