# Outputs for Project 1

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.project1_rg.name
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.project1_vnet.name
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.project1_subnet.id
}

output "nsg_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.project1_nsg.id
}

output "vmss_name" {
  description = "The name of the VM scale set"
  value       = azurerm_linux_virtual_machine_scale_set.project1_vmss.name
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.project1_storage.name
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.project1_container.name
}

output "sql_server_name" {
  description = "The name of the SQL server"
  value       = azurerm_sql_server.project1_sql_server.name
}

output "sql_database_name" {
  description = "The name of the SQL database"
  value       = azurerm_sql_database.project1_sql_db.name
}

output "synapse_workspace_name" {
  description = "The name of the Synapse workspace"
  value       = azurerm_synapse_workspace.project1_synapse.name
}

output "bastion_name" {
  description = "The name of the Bastion host"
  value       = azurerm_bastion_host.project1_bastion.name
}

output "load_balancer_name" {
  description = "The name of the load balancer"
  value       = azurerm_lb.project1_lb.name
}

output "frontend_ip_configuration_name" {
  description = "The name of the frontend IP configuration"
  value       = azurerm_lb_frontend_ip_configuration.project1_fe_config.name
}

output "backend_pool_name" {
  description = "The name of the backend pool"
  value       = azurerm_lb_backend_address_pool.project1_lb_pool.name
}

output "health_probe_name" {
  description = "The name of the health probe"
  value       = azurerm_lb_probe.project1_lb_probe.name
}

output "load_balancing_rule_name" {
  description = "The name of the load balancing rule"
  value       = azurerm_lb_rule.project1_lb_rule.name
}

output "vnet_peering_name" {
  description = "The name of the VNet peering"
  value       = azurerm_virtual_network_peering.project1_vnet_peering.name
}

output "vpn_gateway_name" {
  description = "The name of the VPN gateway"
  value       = azurerm_virtual_network_gateway.project1_vpn_gateway.name
}

output "vpn_public_ip_address" {
  description = "The public IP address of the VPN gateway"
  value       = azurerm_public_ip.project1_vpn_ip.ip_address
}

output "firewall_name" {
  description = "The name of the firewall"
  value       = azurerm_firewall.project1_firewall.name
}

output "firewall_public_ip_address" {
  description = "The public IP address of the firewall"
  value       = azurerm_public_ip.project1_firewall_ip.ip_address
}

output "vm_zone1_name" {
  description = "The name of the VM in zone 1"
  value       = azurerm_linux_virtual_machine.project1_vm_zone1.name
}

output "vm_zone2_name" {
  description = "The name of the VM in zone 2"
  value       = azurerm_linux_virtual_machine.project1_vm_zone2.name
}
