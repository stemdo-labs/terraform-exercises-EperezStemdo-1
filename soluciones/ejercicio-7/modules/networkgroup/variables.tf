
  variable "name" {
    type = string
  }

  variable "location" {
    type = string
  }

  variable "resource_group_name" {
    type = string   
    
  }

  variable "subnet_id" {
   type = string
   description = "The ID of the Network Security Group which should be associated with the Subnet"
  }

  variable "network_security_group_id" {
    type = string
    description = "The ID of the Subnet."
  }