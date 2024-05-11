


module "weekly_exercise" {
  source = "../modulo-weekly-exercise"
  resource_group_name = var.resource_group_name
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
  location = var.location
  subnet_name = var.subnet_name
  address_prefixes = var.address_prefixes
  namenetgroup = var.namenetgroup
  network_interfaces = var.network_interfaces
  virtual_machines = var.virtual_machines
  lb_backend_address_pool_name = var.lb_backend_address_pool_name
  lb_front_name = var.lb_front_name
  lb_name = var.lb_name

}