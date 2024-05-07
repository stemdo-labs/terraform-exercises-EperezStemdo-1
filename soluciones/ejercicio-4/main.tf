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

resource "azurerm_virtual_network" "vnet" {
  count = local.any_variable_empty_null == true || local.contains_any_word == false || local.begin_env == false ? 0 : 1 #si length 0 no crea el recurso
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.existent_resource_group_name
  address_space       = var.vnet_address_space

  tags = merge(
    {
      owner = var.owner_tag
      environment = var.environement_tag
    },
    var.vnet_tags
  )
}

