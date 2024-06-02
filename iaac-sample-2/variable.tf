variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "project1-resource-group"
}

variable "location" {
  description = "The location where resources will be deployed"
  type        = string
  default     = "East US"
}
