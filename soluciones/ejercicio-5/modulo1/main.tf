terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
  }
}

module "nested1" {
  source = "./modules/nested1"
  existent_resource_group_name = var.existent_resource_group_name
  vnet_name = var.vnet_name
  owner_tag = var.owner_tag
  environement_tag = var.environement_tag
  vnet_address_space = var.vnet_address_space
}


