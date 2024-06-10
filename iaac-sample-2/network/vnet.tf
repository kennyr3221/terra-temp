resource "azurerm_virtual_network" "project1_vnet" {
  name                = "project1-vnet"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.project1_vnet
}

resource "azurerm_subnet" "project1_subnet" {
  name                 = "project1-subnet"
  resource_group_name  = azurerm_resource_group.project1_rg.project1_subnet
  virtual_network_name = azurerm_virtual_network.project1_vnet.project1_vnet
  address_prefixes     = ["10.0.1.0/24"]
}
