resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  resource_group_name          = var.resource_group_name
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                = "n01521240-w-vm1"
  resource_group_name = var.resource_group_name
  location            = var.location
  availability_set_id = azurerm_availability_set.windows_avs.id
  admin_username      = var.admin_username_windows
  admin_password      = "Pass12345"       # Replace this with a more secure method like Azure Key Vault
  size                = "Standard_B1s"    # Or you can use var.windows_size if defined
  computer_name       = "n01521240-w-vm1" # Or you can use var.windows_name["HumberID-w-vm1"] if defined

  network_interface_ids = [azurerm_network_interface.network_interface_windows.id] # Provide the ID of the network interface

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    name                 = "n01521240-w-vm1-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS" # Or you can use var.windows_storage_account if defined
  }

  winrm_listener {
    protocol = "Http"
  }
}

resource "azurerm_network_interface" "network_interface_windows" {
  name                = "n01521240-w-vm1-nic"
  resource_group_name = var.resource_group_name
  location            = var.location

  ip_configuration {
    name                          = "n01521240-w-vm1-ipconfig"
    subnet_id                     = var.subnet
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip_windows.id # Remove the index key
  }
}

resource "azurerm_public_ip" "public_ip_windows" {
  name                = "n01521240-w-vm1-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "n01521240-w-vm1"
}
