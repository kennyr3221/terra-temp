resource "azurerm_virtual_network" "project1_vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
}

resource "azurerm_subnet" "project1_subnet" {
  name                 = "project1-subnet"
  resource_group_name  = azurerm_resource_group.project1_rg.name
  virtual_network_name = azurerm_virtual_network.project1_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
