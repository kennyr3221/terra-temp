variable "global_settings" {
  description = "Global settings for the deployment"
  type = object({
    prefixes      = optional(list(string), null)
    suffixes      = optional(list(string), null)
    random_length = optional(number, null)
  })

  default = {
    prefixes      = ["dev"]
    suffixes      = ["001"]
    random_length = 4
    example       = null
  }
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "example-resources"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "example-vnet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "example-subnet"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "public_ip_name" {
  description = "The name of the public IP address"
  type        = string
  default     = "example-publicip"
}

variable "sku_name" {
  description = "The SKU name for the application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "The SKU tier for the application gateway"
  type        = string
  default     = "Standard_v2"
}

variable "sku_capacity" {
  description = "The capacity for the application gateway"
  type        = number
  default     = 1
}

variable "zones" {
  description = "The zones for the application gateway"
  type        = list(number)
  default     = [1, 2]
}

variable "http_listener" {
  description = "The HTTP listener configuration for the application gateway"
  type = map(object({
    name                           = string
    frontend_ip_configuration_name = string
    frontend_port_name             = string
    protocol                       = string
  }))
  default = {
    listener1 = {
      name                           = "listener"
      frontend_ip_configuration_name = "exampleIpConfig"
      frontend_port_name             = "example-1"
      protocol                       = "Https"
    },
    listener2 = {
      name                           = "listener-2"
      frontend_ip_configuration_name = "example-2"
      frontend_port_name             = "example-2-port"
      protocol                       = "Https"
    }
  }
}

variable "frontend_ip_configuration" {
  description = "The frontend IP configuration for the application gateway"
  type = map(object({
    name      = string
    subnet_id = string
  }))
  default = {
    ipconfiguration = {
      name      = "exampleIpConfig"
      subnet_id = null
    }
  }
}

variable "gateway_ip_configuration" {
  description = "The gateway IP configuration for the application gateway"
  type = map(object({
    name      = string
    subnet_id = string
  }))
  default = {
    gw = {
      name      = "gwConfig"
      subnet_id = null
    }
  }
}

variable "backend_address_pool" {
  description = "The backend address pool for the application gateway"
  type = map(object({
    name = string
  }))
  default = {
    pool1 = {
      name = "backend_address_pool"
    }
  }
}

variable "backend_http_settings" {
  description = "The backend HTTP settings for the application gateway"
  type = map(object({
    name                  = string
    port                  = number
    protocol              = string
    cookie_based_affinity = string
  }))
  default = {
    backend = {
      name                  = "backend1"
      port                  = 443
      protocol              = "Https"
      cookie_based_affinity = "Enabled"
    }
  }
}
