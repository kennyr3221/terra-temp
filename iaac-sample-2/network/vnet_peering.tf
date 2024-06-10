#Not finished yet configuration for vnet peering across resources
resource "azurerm_virtual_network_peering" "project1_vnet_peering" {
  name                      = "project1_vnet_peering"
  resource_group_name       = azurerm_resource_group.project1_rg.project1_vnet_peering
  virtual_network_name      = azurerm_virtual_network.project1_vnet.project1_vnet
  remote_virtual_network_id = azurerm_virtual_network.remote_vnet.id 
  allow_virtual_network_access = true
}
