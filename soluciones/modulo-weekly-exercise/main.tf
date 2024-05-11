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

module "networkgroup" {
  source = "./modules/networkgroup"
  namenetgroup = var.namenetgroup
  resource_group_name = var.resource_group_name
  location = var.location
}

resource "azurerm_subnet_network_security_group_association" "assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = module.networkgroup.secgrup_id
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.network_interfaces
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  
  ip_configuration {
    name                          = "internal"
    subnet_id                     =  azurerm_subnet.subnet.id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
 
  for_each            = var.virtual_machines

  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  network_interface_ids = [for interface_key in each.value.network_interface_keys : azurerm_network_interface.nic[interface_key].id]
  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.lb_front_name
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb_backend_address_pool" "backpool" {
  loadbalancer_id      = azurerm_lb.lb.id
  name                 = var.lb_backend_address_pool_name
}

