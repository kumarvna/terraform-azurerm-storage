module "storage" {
  source                  = "kumarvna/storage/azurerm"
  version                 = "1.0.0"

  # Resource Group
  create_resource_group   = false
  resource_group_name     = "rg-demo-westeurope-01"
  location                = "westeurope"
  storage_account_name    = "storageaccwesteupore01"

  # Container lists wiht access_type to create
  containers_list = [
    { name        = "mystore250"
      access_type = "private"}, 
    { name        = "blobstore251"
      access_type = "blob"}, 
    { name      = "containter252"
      access_type = "container"}
  ]

  # Tags for Azure resources
  tags = {
    Terraform     = "true"
    Environment   = "dev"
    Owner         = "test-user"
  }
}