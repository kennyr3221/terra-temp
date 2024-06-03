variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "example-resources"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "East US"
}

variable "global_settings" {
  description = "Global settings for the application gateway module"
  type        = map(any)
  default     = {}
}
