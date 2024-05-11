



# # resource group name

variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "location" {
  type = string
  default = "West Europe"
}

#security group


  variable "namenetgroup" {
    type = string
  }


# vnet

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the virtual network"
  type        = list(string)
}


#subnet

variable "subnet_name" {
  type = string
  description = "The name of the subnet"
}

variable "address_prefixes" {
  type = list(string)
  description = "The address prefixes to use for the subnet."
}

#interfaz de red

variable "network_interfaces" {
  type = map(object({
    name                         = string
    location                     = string
    resource_group_name          = string
    private_ip_address_allocation = string
  }))
}

#MV

variable "virtual_machines" {
  type = map(object({
    vm_name            = string
    resource_group_name = string
    location           = string
    size               = string
    admin_username     = string
    caching            = string
    storage_account_type = string 
    network_interface_keys = list(string)
  }))
}

#lb

variable "lb_name" {
  type = string
}
variable "lb_backend_address_pool_name" {
  type = string
}

variable "lb_front_name" {
  type = string
}


# # vnet

# variable "vnet_name" {
#   description = "Name of the virtual network"
#   type        = string
# }

# variable "vnet_address_space" {
#   description = "Address space of the virtual network"
#   type        = list(string)
# }


# #subnet

# variable "subnet_name" {
#   type = string
#   description = "The name of the subnet"
# }

# variable "address_prefixes" {
#   type = list(string)
#   description = "The address prefixes to use for the subnet."
# }




# #interfaz de red

# variable "name_network_interface" {
#   type = string
#   description = "The name of the Network Interface"
# }

# variable "name_ip_configuration" {
#   type = string
#   description = "A name used for this IP Configuration"
# }

# variable "private_ip_address_allocation" {
#   type = string
#   description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
# }



# # mv


# variable "vm_name" {
#   type = string
#   description = "The name of the Linux Virtual Machine"
# }

# variable "admin_username" {
#   type = string
#   description = " The username of the local administrator used for the Virtual Machine"
# }

# variable "size" {
#   type = string
#   description = "The SKU which should be used for this Virtual Machine, such as Standard_F2"
# }

# #os_disk block

# variable "caching" {
#   type = string
#   description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite"
# }

# variable "storage_account_type" {
#   type = string
#   description = " The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created"
# }





