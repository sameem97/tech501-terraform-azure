output "vm_public_ip" {
  description = "The public IP of the VM"
  value       = azurerm_public_ip.app_ip.ip_address
}

output "app_network_interface_id" {
  description = "The ID of the app network interface"
  value       = azurerm_network_interface.app_nic.id
}

output "db_network_interface_id" {
  description = "The ID of the db network interface"
  value       = azurerm_network_interface.db_nic.id
}