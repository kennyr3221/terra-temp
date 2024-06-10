resource "azurerm_security_center_contact" "sec_admin" {
  email               = "${var.email}"
  phone               = "${var.phone}"
  alert_notifications = true
  alerts_to_admins    = true
}

resource "azurerm_security_center_subscription_pricing" "sec_admin_subscription" {
  tier          = "Standard"
  resource_type = "VirtualMachines"
}
