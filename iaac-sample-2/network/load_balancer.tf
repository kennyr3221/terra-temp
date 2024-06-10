resource "azurerm_lb" "project1_lb" {
  name                = "project1-lb"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name

  frontend_ip_configuration {
    name                 = "project1-fe-config"
    public_ip_address_id = azurerm_public_ip.project1_lb_ip.id
  }
}

resource "azurerm_public_ip" "project1_lb_ip" {
  name                = "project1-lb-ip"
  location            = azurerm_resource_group.project1_rg.location
  allocation_method   = "Static"
  resource_group_name = azurerm_resource_group.project1_rg.name
}

resource "azurerm_lb_backend_address_pool" "project1_lb_pool" {
  loadbalancer_id = azurerm_lb.project1_lb.id
  name            = "project1-backend-pool"
 }

resource "azurerm_lb_rule" "project1_lb_rule" {
  loadbalancer_id                = azurerm_lb.project1_lb.id
  name                           = "project1-lb-rule"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = azurerm_lb.project1_lb.frontend_ip_configuration[0].name
  probe_id                       = azurerm_lb_probe.project1_lb_probe.id
}

resource "azurerm_lb_backend_address_pool_association" "project1_lb_association" {
  backend_address_pool_id = azurerm_lb_backend_address_pool.project1_lb_pool.id
  ip_configuration_id     = azurerm_lb.project1_lb.frontend_ip_configuration[0].id
  loadbalancer_id         = azurerm_lb.project1_lb.id
}

resource "azurerm_public_ip" "project1_lb_ip" {
  name                = "project1-lb-ip"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}