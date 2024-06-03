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

resource "azurerm_public_ip" "project1_vpn_ip" {
  name                = "project1-vpn-ip"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  allocation_method   = "Dynamic"
}
