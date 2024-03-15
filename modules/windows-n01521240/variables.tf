variable "windows_avs" {
}

variable "windows_name" {
  type    = string
  default = "n01521240-w-vm1"  # Assuming you're only deploying one VM
}

variable "subnet" {
}

variable "admin_username_windows" {
  default = "fatemamanakh"
}

variable "windows_storage_account" {
  default = "StandardSSD_LRS"
}

variable "windows_disk_size" {
  default = 128
}

variable "windows_caching" {
  default = "ReadWrite"
}

variable "windows_publisher" {
  default = "MicrosoftWindowsServer"
}

variable "windows_offer" {
  default = "WindowsServer"
}

variable "windows_sku" {
  default = "2019-Datacenter"
}

variable "windows_version" {
  default = "latest"
}

variable "location" {
}

variable "resource_group_name" {
}
