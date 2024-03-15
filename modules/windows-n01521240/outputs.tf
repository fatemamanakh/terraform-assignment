output "vm_hostname_windows" {
  value = azurerm_windows_virtual_machine.windows_vm.computer_name
}

output "private_ip_addresses_windows" {
  value = azurerm_network_interface.network_interface_windows.ip_configuration[0].private_ip_address
}

output "public_ip_addresses_windows" {
  value = azurerm_public_ip.public_ip_windows.ip_address
}

output "vm_fqdn_windows" {
  value = azurerm_public_ip.public_ip_windows.fqdn
}


output "windows_vm_id" {
  value = azurerm_windows_virtual_machine.windows_vm.id
}
