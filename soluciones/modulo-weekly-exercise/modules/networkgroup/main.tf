
resource "azurerm_network_security_group" "secgroup" {
  name                = var.namenetgroup
  location            = var.location
  resource_group_name = var.resource_group_name
}

#resource "azurerm_subnet_network_security_group_association" "secgroupsassoc" {
#  subnet_id = module.networkgroup.subnet_id
#  network_security_group_id = azurerm_network_security_group.secgroup.id
#}