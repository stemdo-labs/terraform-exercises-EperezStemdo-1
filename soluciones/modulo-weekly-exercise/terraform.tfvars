
resource_group_name = "rg1eperez-lab01"
vnet_name = "vnetepereztfexercise"
vnet_address_space = ["10.0.0.0/16"]
location = "West Europe"
#subnet
subnet_name = "subneteperez"
#virtual_network_name = "vnetepereztfexercise07"
address_prefixes     = ["10.0.1.0/24"]

#Interfaz de red

name_network_interface = "networinterfazperez"
name_ip_configuration = "ipconfeperez"
private_ip_address_allocation = "Dynamic"


#vm

admin_username = "eperez"
vm_name = "vmeperez"
size = "Standard_F2"
caching = "ReadWrite"
storage_account_type = "Standard_LRS"


# variable "network_interface" {
#   type = {
#     name = "network_interface_1"
#     location = "West Europe"
#     resource_group_name = "rg1eperez-lab01"
#     ip_configuration = {
#       name = string
#       subnet_id = string
#       private_ip_address_allocation = string
#     }
#      ip_configuration = {
#         name = string
#       subnet_id = string
#       private_ip_address_allocation = string
#       }, {}
#   }
  
# }

# name_network_interface = 

# name_ip_configuration = 

# variable "private_ip_address_allocation" {
#   type = string
#   description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
# }

# # virtual machine

# variable "name" {
#   description = "The name of the Linux Virtual Machine"
  
# }

# variable "admin_username" {
#   description = " The username of the local administrator used for the Virtual Machine"
# }

# variable "network_interface_ids" {
#   description = "A list of Network Interface IDs which should be attached to this Virtual Machine"
  
# }

# variable "size" {
#   description = "The SKU which should be used for this Virtual Machine, such as Standard_F2"
# }

# #os_disk block

# variable "caching" {
#   description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite"
# }

# variable "storage_account_type" {
#   description = " The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created"
# }
