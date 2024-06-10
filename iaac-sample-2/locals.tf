# locals.tf
locals {
  tags = var.environment == "production" ? var.tags_production : var.tags_testing
}
