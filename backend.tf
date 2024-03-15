terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01521240RG"
    storage_account_name = "tfstaten01521240sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
  }
}

