terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "rg1eperez-lab01"
      storage_account_name = "sta1eperez" 
      container_name       = "tfstateeperez"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}