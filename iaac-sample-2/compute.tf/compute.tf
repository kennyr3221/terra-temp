resource "azurerm_linux_virtual_machine_scale_set" "project1_vmss" {
  name                = "project1-vmss"
  location            = azurerm_resource_group.project1_rg.location
  resource_group_name = azurerm_resource_group.project1_rg.name
  sku                 = "Standard_DS1_v2"
  instances           = 2
  admin_username      = "azureuser"
  admin_password      = "P@ssword1234!"

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name = "project1-nic"

    ip_configuration {
      name      = "internal"
      subnet_id = azurerm_subnet.project1_subnet.id
      primary   = true
    }
  }
}

resource "azurerm_linux_virtual_machine" "project1_vm_zone1" {
  name                = "project1-vm-zone1"
  location            = "East US 2"
  resource_group_name = azurerm_resource_group.project1_rg.name
  size                = "Standard_DS1_v2"
  admin_username      = "azureuser"
  admin_password      = "P@ssword1234!"
  zone                = "1"

  network_interface_ids = [
    azurerm_network_interface.project1_nic_zone1.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "project1_nic_zone1" {
  name                = "project1-nic-zone1"
  location            = "East US 2"
  resource_group_name = azurerm_resource_group.project1_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.project1_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "project1_vm_zone2" {
  name                = "project1-vm-zone2"
  location            = "West US 2"
  resource_group_name = azurerm_resource_group.project1_rg.name
  size                = "Standard_DS1_v2"
  admin_username      = "azureuser"
  admin_password      = "P@ssword1234!"
  zone                = "2"

  network_interface_ids = [
    azurerm_network_interface.project1_nic_zone2.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "project1_nic_zone2" {
  name                = "project1-nic-zone2"
  location            = "West US 2"
  resource_group_name = azurerm_resource_group.project1_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.project1_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
