locals {
  # Define a local value 'name_suffix' that combines the 'project' and 'environment' values
  # from the 'resource_tags' variable. This creates a unique suffix for resource names.
  name_suffix = "${var.resource_tags["project"]}-${var.resource_tags["environment"]}"
  
  # Define a local value 'tags' that selects the appropriate set of tags based on the current
  # environment. It uses a map lookup where the keys are environment names ('production' and 'testing'),
  # and the values are the corresponding tag maps (var.tags_production and var.tags_testing).
  tags = {
    production = var.tags_production,
    testing    = var.tags_testing
  }[var.environment]
}
