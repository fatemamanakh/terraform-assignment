resource "null_resource" "vmlinux-provisioner-linux" {
  for_each = local.instances

  provisioner "remote-exec" {
    inline = ["echo Hostname: $(hostname)"]
  }

  connection {
    type = "ssh"
    user = var.vmlinux-info.admin_ssh_key.admin_username
    host        = azurerm_linux_virtual_machine.n01521240-vmlinux[each.key].public_ip_address
    private_key = file(var.vmlinux-info.private_key)
  }

  depends_on = [azurerm_linux_virtual_machine.n01521240-vmlinux]
}