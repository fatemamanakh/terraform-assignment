output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "virtual_network_name" {
  value = module.network.virtual_network_name
}
output "subnet_name" {
  value = module.network.subnet_name
}

output "log_analytics_workspace_name" {
  value = module.common.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}

output "loadbalancer" {
  value = module.loadbalancer.n01521240-loadbalancer-name
}

output "loadbalancer-ip" {
  value = module.loadbalancer.n01521240-loadbalancer-ip
}

output "database_instance_name" {
  value = module.database.database_instance_name
}

output "windows_vm_hostnames" {
  sensitive = true
  value     = module.windows.vm_hostname_windows

}

output "windows_vm_private_ip" {
  value = module.windows.private_ip_addresses_windows
}

output "windows_vm_public_ip" {
  value = module.windows.public_ip_addresses_windows
}


output "windows_vm_fqdn" {
  value = module.windows.vm_fqdn_windows
}
