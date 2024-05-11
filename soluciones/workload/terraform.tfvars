# all_data = {
#   example1 = {
#     resource_group_name        = "rg1eperez-lab01"
#     location                   = "West Europe"
#     namenetgroup               = "epereznetworksecuritygroup"
#     vnet_name                  = "vnetepereztfexercise"
#     vnet_address_space         = ["10.0.0.0/16"]
#     subnet_name                = "subneteperez"
#     address_prefixes           = ["10.0.1.0/24"]
#     network_interfaces         = {
#       nic1 = {
#         name                         = "niceperez1"
#         #location                     = "West Europe"
#         #resource_group_name          = "rg1eperez-lab01"
#         private_ip_address_allocation = "Dynamic"
#       }
#       nic2 = {
#         name                         = "niceperez2"
#         #location                     = "West Europe"
#         #resource_group_name          = "rg1eperez-lab01"
#         private_ip_address_allocation = "Dynamic"
#       }
#     }
#      network_interfaces = {
#     virtual_machines           = {
#       vm1 = {
#         vm_name            = "vmeperez1"
#         #resource_group_name = "rg1eperez-lab01"
#         #location           = "West Europe"
#         size               = "Standard_F2"
#         admin_username     = "eperez"
#         caching            = "ReadWrite"
#         storage_account_type = "Standard_LRS"
#         network_interface_keys = ["nic1"]
#       }
#       vm2 = {
#         vm_name            = "vmeperez2"
#         #resource_group_name = "rg1eperez-lab01"
#         #location           = "West Europe"
#         size               = "Standard_F2"
#         admin_username     = "eperez"
#         caching            = "ReadWrite"
#         storage_account_type = "Standard_LRS"
#         network_interface_keys = ["nic2"]
#       }
#     }
    
#     lb_name                    = "lbeperez"
#     lb_backend_address_pool_name = "backpooleperez"
#     lb_front_name              = "fronteperez"
#   }
# }
# }




resource_group_name = "rg1eperez-lab01"
vnet_name = "vnetepereztfexercise"
vnet_address_space = ["10.0.0.0/16"]
location = "West Europe"
#subnet
subnet_name = "subneteperez"
#virtual_network_name = "vnetepereztfexercise07"
address_prefixes     = ["10.0.1.0/24"]

#security group
namenetgroup = "epereznetworksecuritygroup"


#tfstate
container_name = "tfstateeperez"
container_access_type = "private"




#network interface
network_interfaces = {
  nic1 = {
    name                       = "niceperez1"
    location                   = "West Europe"
    resource_group_name        = "rg1eperez-lab01"
    private_ip_address_allocation = "Dynamic"
  }
  nic2 = {
    name                       = "niceperez2"
    location                   = "West Europe"
    resource_group_name        = "rg1eperez-lab01"
    private_ip_address_allocation = "Dynamic"

  }

}

#vm

 virtual_machines = {
  
    vm1 = {
      vm_name            = "vmeperez1"
      resource_group_name = "rg1eperez-lab01"
      location           = "West Europe"
      size               = "Standard_F2"
      admin_username     = "eperez"
      caching            = "ReadWrite"
      storage_account_type = "Standard_LRS"
     network_interface_keys = ["nic1"]
  }
  
    vm2 = {
      vm_name            = "vmeperez2"
      resource_group_name = "rg1eperez-lab01"
      location           = "West Europe"
      size               = "Standard_F2"
      admin_username     = "eperez"
      caching            = "ReadWrite"
      storage_account_type = "Standard_LRS"
    network_interface_keys = ["nic2"]

    }
  
}

#lb
lb_backend_address_pool_name = "backpooleperez"
lb_name = "lbeperez"
lb_front_name = "fronteperez"






# resource_group_name = "rg1eperez-lab01"
# vnet_name = "vnetepereztfexercise"
# vnet_address_space = ["10.0.0.0/16"]
# location = "West Europe"
# subnet
# subnet_name = "subneteperez"
# virtual_network_name = "vnetepereztfexercise07"
# address_prefixes     = ["10.0.1.0/24"]

# security group
# namenetgroup = "epereznetworksecuritygroup"


# tfstate
# container_name = "tfstateeperez"
# container_access_type = "private"


# Interfaz de red

# name_network_interface = "networinterfazperez"
# name_ip_configuration = "ipconfeperez"
# private_ip_address_allocation = "Dynamic"

# VM

# admin_username = "eperez"
# vm_name = "vmeperez"
# size = "Standard_F2"
# caching = "ReadWrite"
# storage_account_type = "Standard_LRS"