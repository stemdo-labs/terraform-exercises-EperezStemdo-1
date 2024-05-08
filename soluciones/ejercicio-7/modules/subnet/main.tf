
resource "azurerm_subnet" "subnet" {
  count = length(var.namessubnet)
  name = var.namessubnet[count.index]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes
}