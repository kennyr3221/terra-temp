resource "azurerm_public_ip" "failover_ip" {
  name                = "failover-ip"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  allocation_method   = "Static"
  tags                = locals.tags
}

resource azurerm_virtual_machine "failover_vm" {
  name                  = "failover-vm"
  resource_group_name   = azurerm_resource_group.project1_rg.name
  location              = azurerm_resource_group.project1_rg.location
  network_interface_ids = [azurerm_network_interface.failover_nic.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "{($var.compute_name)}"
    admin_username = "{($var.admin_username)}"
    admin_password = "{($var.admin_password)}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = locals.tags
}
