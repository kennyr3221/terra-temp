resource "azurerm_firewall" "project1_firewall" {
  name                = "project1_firewall"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_firewall.project1_rg
  sku_tier            = "Standard" 
  sku_name            = "AZFW_Hub" 

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.project1_firewall_ip.id
  }
}

resource "azurerm_public_ip" "project1_firewall_ip" {
  name                = "project1-firewall-ip"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.project1_firewall_ip
  allocation_method   = "Static"
}
