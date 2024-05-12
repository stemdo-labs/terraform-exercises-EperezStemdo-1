# Salida en la teminal

```
PS C:\Users\eperez\EjerciciosBootcamp\6-terraform-2\terraform-exercises-EperezStemdo-1\soluciones\ejercicio-5\modulo1> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

   module.nested1.azurerm_virtual_network.vnet will be created
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

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

```