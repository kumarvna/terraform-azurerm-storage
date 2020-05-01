module "storageacc" {
  source                  = "github.com/tietoevry-infra-as-code/terraform-azurerm-storage?ref=v1.0.0"
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

  tags = {
    application_name      = "demoapp01"
    owner_email           = "user@example.com"
    business_unit         = "publiccloud"
    costcenter_id         = "5847596"
    environment           = "development"
  }      
}