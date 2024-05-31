terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
    azcli = {
      source = "azure/azapi"
    }
  }
  required_version = ">=0.15"
}

provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "this" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_virtual_network" "this" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}

resource "azurerm_subnet" "this" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "this" {
  name                = "example-publicip"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
}

module "application_gateway" {
source              = "../.."
  global_settings     = var.global_settings
  name                = "appgateway"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location

  sku_name     = "Standard_v2"
  sku_tier     = "Standard_v2"
  sku_capacity = 1
  zones        = [1, 2]

  http_listener = {
    listener1 = {
      name                           = "listener"
      frontend_ip_configuration_name = "exampleIpConfig"
      frontend_port_name             = "example-1"
      protocol                       = "Https"
    },
    listner2 = {
      name                           = "listener-2"
      frontend_ip_configuration_name = "example-2"
      frontend_port_name             = "example-2-port"
      protocol                       = "Https"
    }
  }

  frontend_ip_configuration = {
    ipconfiguration = {
      name      = "exampleIpConfig"
      subnet_id = azurerm_subnet.this.id
    }
  }

  gateway_ip_configuration = {
    gw = {
      name      = "gwConfig"
      subnet_id = azurerm_subnet.this.id
    }
  }

  backend_address_pool = {
    pool1 = {
      name = "backend_address_pool"
    }
  }

  backend_http_settings = {
    backend = {
      cookie_based_affinity = "Enabled"
      name                  = "backend1"
      port                  = 443
      protocol              = "Https"
    }
  }
}
