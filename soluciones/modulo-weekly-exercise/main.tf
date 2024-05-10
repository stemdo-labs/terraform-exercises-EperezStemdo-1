terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  # backend "azurerm" {
  #     resource_group_name  = "rg1eperez-lab01"
  #     storage_account_name = "sta1eperez" 
  #     container_name       = "tfstateeperez"
  #     key                  = "terraform.tfstate"
  # }

}

provider "azurerm" {
  features {}
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

# module "tfstate" {
#   source = "./modules/tfstate"
#   resource_group_name = var.resource_group_name
#   container_access_type = var.container_access_type
#   container_name = var.container_name
# } 



resource "azurerm_subnet" "subnet" {
  depends_on = [ module.vnet ]
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
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
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = module.networkgroup.secgrup_id
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
    username   = var.admin_username
    public_key = file("~/.ssh/id_rsa.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}



# resource "azurerm_network_interface" "nic" {
#   for_each            = var.network_interfaces
#   name                = each.key
#   location            = each.value.location
#   resource_group_name = each.value.resource_group_name
  
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     =  azurerm_subnet.subnet.id
#     private_ip_address_allocation = each.value.private_ip_address_allocation
#   }
# }



# resource "azurerm_linux_virtual_machine" "vm" {
 
#   for_each            = var.virtual_machines

#   name                = each.value.vm_name
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   size                = each.value.size
#   admin_username      = each.value.admin_username
#   network_interface_ids = [for interface_key in each.value.network_interface_keys : azurerm_network_interface.nic[interface_key].id]
#   os_disk {
#     caching              = each.value.caching
#     storage_account_type = each.value.storage_account_type
#   }

#   admin_ssh_key {
#     username   = each.value.admin_username
#     public_key = file("~/.ssh/id_rsa.pub")
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }


resource "azurerm_public_ip" "publicip" {
  name                = "PublicIPForLB"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_lb" "lb" {
  name                = "TestLoadBalancer"
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}


# resource "azurerm_subnet" "this" {
#   for_each = var.subnets
#   name                 = each.key
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.this.name
#   address_prefixes     = each.value.subnet_address_prefixes
# }


