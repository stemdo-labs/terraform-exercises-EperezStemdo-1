#vnet
existent_resource_group_name = "rg1eperez-lab01"
vnet_name = "vnetepereztfexercise01"
vnet_address_space = ["10.0.0.0/16"]
location = "West Europe"
owner_tag = "eperez"
environement_tag = "dev"
vnet_tags = {
  "owner" = "eperez"
}

#subnet
namessubnet = ["subneteperez", "subneteperez2"]
resource_group_name  = "rg1eperez-lab01"
virtual_network_name = "vnetepereztfexercise07"
address_prefixes     = ["10.0.1.0/24"]


#Network Security Group

  namenetgroup = "epereznetworksecuritygroup"
