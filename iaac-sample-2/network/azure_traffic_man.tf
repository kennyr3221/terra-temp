resource "azurerm_traffic_manager_profile" "project1_tm" {
  name                = "project1-tm"
  resource_group_name = azurerm_resource_group.project1_rg.project1_tm
  location            = azurerm_resource_group.project1_rg.location
  traffic_routing_method = "Performance"
  dns_config {
    relative_name = "tm."
    ttl           = 30
  }

  monitor_config {
    protocol = "HTTP"
    port     = 80
    path     = "/"
  }

  tags = local.tags
}

resource "azurerm_traffic_manager_endpoint" "tm_endpoint" {
  name                = "tm_endpoint"
  profile_name        = azurerm_traffic_manager_profile.project1_tm.tm_endpoint
  resource_group_name = azurerm_resource_group.project1_rg.project1_rg
  type                = "azureEndpoints"
  target_resource_id  = azurerm_public_ip.project1_vm_zone1.id
}

resource "azurerm_traffic_manager_endpoint" "tm_endpoint" {
  name                = "tm_endpoint"
  profile_name        = azurerm_traffic_manager_profile.project1_tm.tm_endpoint
  resource_group_name = azurerm_resource_group.project1_rg.project1_rg
  type                = "azureEndpoints"
  target_resource_id  = azurerm_public_ip.project1_vm_zone2.id
}