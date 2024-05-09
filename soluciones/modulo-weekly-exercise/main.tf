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


# module "resourcegroup" {
#   source = "./modules/resourcegroup"
#   resource_group_name = var.resource_group_name
#   location = var.location
# }


module "vnet" {
  source = "./modules/vnet"
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
  resource_group_name = var.resource_group_name
}




resource "azurerm_subnet" "subnet" {
  depends_on = [ module.vnet ]
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}



resource "azurerm_network_interface" "nic" {
  depends_on = [ azurerm_subnet.subnet ]
  #for_each = var.network_interface
  # name                = each.value.name
  # location            = each.value.location
  # resource_group_name = each.value.resource_group_name
  name = var.name_ip_configuration
  location = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                =  var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = var.caching
    storage_account_type = var.storage_account_type
  }

    admin_ssh_key {
    username   = "eperez"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}

resource "azurerm_public_ip" "example" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "example" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}