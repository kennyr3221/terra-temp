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
  }

