resource "azurerm_servicebus_namespace" "sb_namespace" {
  name                = "sb_namespace"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.sb_namespace
  sku                 = "Premium"
  local_auth_enabled  = true
  public_network_access_enabled    = false
  zone_redundant      = true
  
resource "azurerm_servicebus_queue" "servicebus_queue" {
  name                = "servicebus-queue"
  resource_group_name = azurerm_servicebus_namespace.servicebus_queue.project1_rg
  namespace_name      = azurerm_servicebus_namespace.servicebus_queue.sb_namespace
  premium_messaging_partitioning   = 2
  infrastructure_encryption_enable = true 
  }
}