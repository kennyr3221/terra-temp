resource "azurerm_bastion_host" "project1_bastion" {
  name                = "project1_bastion"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.project1_bastion
  dns_name            = "project1_bastion"
  sku                 = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.project1_subnet.id
    public_ip_address_id = azurerm_public_ip.project1_bastion_ip.id
  }
}

resource "azurerm_public_ip" "project1_bastion_ip" {
  name                = "project1_bastion-ip"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.project1_bastion_ip
  allocation_method   = "Static"
  sku                 = "Standard"
}
