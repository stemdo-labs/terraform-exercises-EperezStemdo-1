#output "subnet_id" {
 # value = azurerm_subnet.subnet.id
#}

output "subnets_ids" {
  value = [for subnet in azurerm_subnet.subnet : subnet.id]
}