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

module "vnet" {
  source = "./modules/vnet"
  existent_resource_group_name = var.existent_resource_group_name
  vnet_name = var.vnet_name
  owner_tag = var.owner_tag
  environement_tag = var.environement_tag
  vnet_address_space = var.vnet_address_space
}

module "subnet" {
  source = "./modules/subnet"
  namessubnet = var.namessubnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}
module "networkgroup" {
  source = "./modules/networkgroup"
  namenetgroup = var.namenetgroup
  resource_group_name = var.resource_group_name
  location = var.location
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  #subnet_id                 = module.subnet.subnet_id   #"The ID of the Subnet"
  #network_security_group_id = module.networkgroup.secgrup_id  #"The ID of the Network Security Group which should be associated with the Subnet"
  subnet_id                 = module.subnet.subnet_ids[0]
  network_security_group_id = module.networkgroup.secgrup_id
}