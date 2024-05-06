# Ejercicio 1

## Loguearse en AZURE

```
 az login
 az account set --subscription "86f76907-b9d5-46fa-a39d-aff8432a1868"
```


## Instalación del proveedor 

Siguiendo la documentación de terraform se puede obtener el código para la instalación del proveedor: https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build

``` 
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}
```

## Creación de un grupo de recursos

```
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}
```


### terraform init

Para instalar los plugins del proveedor


### terraform plan -out rg.tfplan

Para visualizar el plan de cambios que se aplicarán


### terraform apply

Para aplicar dichos cambios

