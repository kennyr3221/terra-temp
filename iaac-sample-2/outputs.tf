output "resource_group_name" {
  value = azurerm_resource_group.project1_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.project1_storage.name
}

output "sql_server_name" {
  value = azurerm_sql_server.project1_sql_server.name
}

output "synapse_workspace_name" {
  value = azurerm_synapse_workspace.project1_synapse.name
}

output "vpn_gateway_ip" {
  value = azurerm_public_ip.project1_vpn_ip.ip_address
}

output "firewall_ip" {
  value = azurerm_public_ip.project1_firewall_ip.ip_address
}

output "bastion_host_name" {
  value = azurerm_bastion_host.project1_bastion.name
}
