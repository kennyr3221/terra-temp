resource "azurerm_traffic_manager_profile" "example" {
  name                = "example-tm-profile"
  resource_group_name = azurerm_resource_group.project1_rg.name
  location            = azurerm_resource_group.project1_rg.location
  traffic_routing_method = "Performance"
  dns_config {
    relative_name = "exampletm"
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

  tags = local.tags
}

resource "azurerm_traffic_manager_endpoint" "example" {
  name                = "example-tm-endpoint"
  profile_name        = azurerm_traffic_manager_profile.example.name
  resource_group_name = azurerm_resource_group.project1_rg.name
  type                = "azureEndpoints"
  target_resource_id  = azurerm_public_ip.example.id
}
