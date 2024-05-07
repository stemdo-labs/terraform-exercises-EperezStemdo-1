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

locals {
  listavariables = [
    var.owner_tag,
    var.environement_tag,
    var.vnet_name,
    var.vnet_tags
  ]

  # Verificar si alguna variable está vacía o es null
  any_variable_empty_null = length([for i in local.listavariables : i if length(i) == 0 || i == null]) > 0 ? true : false
}

locals {
    #elist = split(",", var.environement_tag)
    elist = [for word in split(",", var.environement_tag) : lower(word)]
}

locals {
  contains_any_word = contains(local.elist, "dev") || contains(local.elist, "pro") || contains(local.elist, "tes") || contains(local.elist, "pre") ? true : false
}

locals {
  begin_env = startswith(var.vnet_name, "vnet") ? true : false
}