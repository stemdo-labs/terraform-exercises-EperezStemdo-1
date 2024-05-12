# Salidas en la consola

```
PS C:\Users\eperez\EjerciciosBootcamp\6-terraform-2\terraform-exercises-EperezStemdo-1\soluciones\ejercicio-7> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

   azurerm_subnet_network_security_group_association.assoc will be created
  + resource "azurerm_subnet_network_security_group_association" "assoc" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

   module.networkgroup.azurerm_network_security_group.secgroup will be created
  + resource "azurerm_network_security_group" "secgroup" {
      + id                  = (known after apply)
      + location            = "westeurope"
      + name                = "epereznetworksecuritygroup"
      + resource_group_name = "rg1eperez-lab01"
      + security_rule       = (known after apply)
    }

   module.subnet.azurerm_subnet.subnet[0] will be created
  + resource "azurerm_subnet" "subnet" {
      + address_prefixes                               = [
          + "10.0.1.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "subneteperez"
      + resource_group_name                            = "rg1eperez-lab01"
      + virtual_network_name                           = "vnetepereztfexercise07"
    }

   module.subnet.azurerm_subnet.subnet[1] will be created
  + resource "azurerm_subnet" "subnet" {
      + address_prefixes                               = [
          + "10.0.1.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "subneteperez2"
      + resource_group_name                            = "rg1eperez-lab01"
      + virtual_network_name                           = "vnetepereztfexercise07"
    }

   module.vnet.azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space       = [
          + "10.0.0.0/16",
        ]
      + dns_servers         = (known after apply)
      + guid                = (known after apply)
      + id                  = (known after apply)
      + location            = "westeurope"
      + name                = "vnetepereztfexercise01"
      + resource_group_name = "rg1eperez-lab01"
      + subnet              = (known after apply)
      + tags                = {
          + "environment" = "dev"
          + "owner"       = "eperez"
        }
    }

Plan: 5 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
````