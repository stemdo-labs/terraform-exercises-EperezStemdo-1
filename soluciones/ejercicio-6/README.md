# Salidas en la terminal

```
PS C:\Users\eperez\EjerciciosBootcamp\6-terraform-2\terraform-exercises-EperezStemdo-1\soluciones\ejercicio-6> terraform init

Initializing the backend...
Initializing modules...
Downloading git::https://github.com/stemdo-labs/terraform-exercises-EperezStemdo-1.git for nested1...
- nested1 in .terraform\modules\nested1\soluciones\ejercicio-5\modulo1
- nested1.nested1 in .terraform\modules\nested1\soluciones\ejercicio-5\modulo1\modules\nested1

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "~> 3.0.2"...
- Installing hashicorp/azurerm v3.0.2...
- Installed hashicorp/azurerm v3.0.2 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
______________
```
PS C:\Users\eperez\EjerciciosBootcamp\6-terraform-2\terraform-exercises-EperezStemdo-1\soluciones\ejercicio-6> terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

   module.nested1.module.nested1.azurerm_virtual_network.vnet will be created
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

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── 

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```