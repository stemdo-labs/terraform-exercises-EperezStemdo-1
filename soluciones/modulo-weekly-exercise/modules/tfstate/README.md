# Configurar almacenamiento de estado remoto en Azure Blob Storage.

### 1: Creación de la cuenta y contenedor blob de almanenamiento 

Para ello se utilizan los recursos:
- azurerm_storage_account
- azurerm_storage_container


### 2: Configurar el estado del backend de terraform

Se añade el archivo ``backend.tf`` con la configuración. Se necesitan:

- storage_account_name: el nombre de la cuenta de Azure Storage.
- container_name: el nombre del contenedor de blobs.
- key: el nombre del archivo de almacén de estado que se va a crear.

Se obtiene la siguiente salida en la consola:

```
Initializing the backend...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "azurerm" backend. No existing state was found in the newly
  configured "azurerm" backend. Do you want to copy this state to the new "azurerm"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value: yes


Successfully configured the backend "azurerm"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Reusing previous version of hashicorp/random from the dependency lock file
- Using previously-installed hashicorp/azurerm v3.102.0
- Using previously-installed hashicorp/random v3.6.1

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

Y se puede ver dentro del contenedor el estado ``terraform.tfstate``

### 3: Capturas de pantalla de los recursos creados 

![](./resultado1.png)
![](./resultado3.png)
![](./resultado2.png)
