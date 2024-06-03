resource "azurerm_firewall" "project1_firewall" {
  name                = "project1-firewall"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  sku_tier            = "Standard"  # Add the missing "sku_tier" attribute
  sku_name            = "AZFW_Hub"  # Add the missing "sku_name" attribute

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.project1_firewall_ip.id
  }
}

resource "azurerm_public_ip" "project1_firewall_ip" {
  name                = "project1-firewall-ip"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  allocation_method   = "Static"
}
