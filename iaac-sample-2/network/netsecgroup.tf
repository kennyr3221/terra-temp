resource "azurerm_network_security_group" "project1_nsg" {
  name                = "project1-nsg"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.project1_nsg
}

resource "azurerm_subnet_network_security_group_association" "project1_snet_assoc" {
  subnet_id                 = azurerm_subnet.project1_subnet.id
  network_security_group_id = azurerm_network_security_group.project1_nsg.id
}
