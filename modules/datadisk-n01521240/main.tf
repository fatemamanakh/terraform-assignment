resource "azurerm_managed_disk" "n01521240-vmlinux-datadisk" {
  resource_group_name = var.resource_group_name
  location            = var.location

  # count = var.vmlinux-datadisk-info.total-vms
  count                = length(var.vmlinux-datadisk-info.n01521240-vmlinux-names)
  name                 = "${var.vmlinux-datadisk-info.n01521240-vmlinux-names[count.index]}-datadisk-${format("%d", count.index + 1)}"
  storage_account_type = var.vmlinux-datadisk-info.storage_account_type
  create_option        = var.vmlinux-datadisk-info.create_option
  disk_size_gb         = var.vmlinux-datadisk-info.disk_size_gb

  tags = var.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "n01521240-vmlinux-datadisk-attachment" {
  count              = length(var.vmlinux-datadisk-info.n01521240-vmlinux-names)
  managed_disk_id    = azurerm_managed_disk.n01521240-vmlinux-datadisk[count.index].id
  virtual_machine_id = var.vmlinux-datadisk-attachment-info.virtual_machine_ids[count.index]
  lun                = var.vmlinux-datadisk-attachment-info.lun
  caching            = var.vmlinux-datadisk-attachment-info.caching

  depends_on = [azurerm_managed_disk.n01521240-vmlinux-datadisk]
}


# resource "azurerm_virtual_machine_data_disk_attachment" "n01521240-vmwindows-datadisk-attachment" {
#   count              = length(var.windows_datadisk_info.windows_vm_names)
#   managed_disk_id    = azurerm_managed_disk.n01521240-vmwindows-datadisk[count.index].id
#   virtual_machine_id = var.windows_datadisk_attachment_info.virtual_machine_ids[count.index]
#   lun                = var.windows_datadisk_attachment_info.lun
#   caching            = var.windows_datadisk_attachment_info.caching

#   depends_on = [azurerm_managed_disk.n01521240-vmwindows-datadisk]
# }

# resource "azurerm_virtual_machine_data_disk_attachment" "n01521240-windows-datadisk-attachment" {
#   count              = length(module.datadisk.managed_disk_ids)
#   managed_disk_id    = module.datadisk.managed_disk_ids[count.index]
#   virtual_machine_id = azurerm_windows_virtual_machine.windows_vm.id
#   lun                = 1  # Logical Unit Number for the data disk
#   caching            = "None"  # Caching configuration, adjust as needed

#   depends_on = [module.datadisk]
# }