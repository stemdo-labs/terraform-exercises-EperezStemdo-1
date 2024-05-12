variable "existent_resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "location" {
  type = string
  default = "West Europe"
}


variable "owner_tag" {
  type = string
  description = "El propietario de la VNet"
}

variable "environement_tag" {
  default = "env,pro,tes,pre"
  type    = string
  description = "Entorno de la VNet"
}


variable "vnet_tags" {
  type = map(string)
  default = {}
  description = "Tags adicionales de la VNet"
}
