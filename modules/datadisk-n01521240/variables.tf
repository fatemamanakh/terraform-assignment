variable "common_tags" {
  type        = map(string)
  description = "This block is to define common tags"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# This
variable "vmlinux-datadisk-info" {
  type        = any
  description = "Contians information about the datadisk for Linux VMs"
}

variable "vmlinux-datadisk-attachment-info" {
  type        = any
  description = "Contians information about attachment configurations for Linux VMs and their respective datadisks"
}

variable "windows_datadisk_info" {
  type        = any
  description = "Contains information about the data disk for Windows VMs"
}

variable "windows_datadisk_attachment_info" {
  type        = any
  description = "Contains information about attachment configurations for Windows VMs and their respective data disks"
}
