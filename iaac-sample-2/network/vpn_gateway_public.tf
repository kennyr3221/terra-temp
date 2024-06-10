resource "azurerm_public_ip" "project1_vpn_ip" {
  name                = "project1-vpn-ip"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "project1_vpn_gateway" {
  name                = "project1-vpn-gateway"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"
  active_active       = false
  enable_bgp          = false

  ip_configuration {
    name                          = "vpngateway-ip-config"
    public_ip_address_id          = azurerm_public_ip.project1_vpn_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
}

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.project1_subnet.id
  }

  frontend_port {
    name = "frontdoor"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontendipconfiguration"
    public_ip_address_id = azurerm_public_ip.var.id
  }

  backend_address_pool {
    name = "backendaddresspool"
  }

  backend_http_settings {
    name                  = "backendhttpsettings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
  }

  http_listener {
    name                           = "httplistener"
    frontend_ip_configuration_name = "frontendipconfiguration"
    frontend_port_name             = "frontendport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routingrule"
    rule_type                  = "PathBasedRouting"
    http_listener_name         = "httplistener"
    backend_address_pool_name  = "backendaddresspool"
    backend_http_settings_name = "backendhttpsettings"
  }

  tags = local.tags{}
