# terraform-modules
This repo will be used to house the Terraform modules I will use to deploy infrastructure in my TFlearn pipeline


**To do

*build out modules for storage account, vnets, and nsg
*figure out how to call module into other pipeline
*git better at terraform and study for associates exam. 

## Usage
~~~
module "storage_module" {
  source = "https://github.com/arand18/terraform-modules.git/storage_module"

  name                     = "${local.storage_name}001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
  account_kind             = "BlobStorage"

}
~~~