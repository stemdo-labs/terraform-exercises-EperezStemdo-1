
resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}


resource "azurerm_storage_container" "tfstate" {
  name                  = var.container_name
  storage_account_name  = "sta1eperez" 
  container_access_type = var.container_access_type
}