# Azure Storage Account creation with additional Resources

Configuration in this directory creates a set of Azure storage resources. Few of these resources added/excluded as per your requirement.

## Module Usage

## Storage account with Containers

Following example to create a storage account with a few containers.

```
module "storage" {
  source                  = "kumarvna/storage/azurerm"
  version                 = "1.0.0"

  # Resource Group
  create_resource_group   = true
  resource_group_name     = "rg-demo-westeurope-01"
  location                = "westeurope"
  storage_account_name    = "storageaccwesteupore01"

  # Container lists wiht access_type to create
  containers_list = [
    { name        = "mystore250"
      access_type = "private"},
    { name        = "blobstore251"
      access_type = "blob"},
    { name        = "containter252"
      access_type = "container"}
  ]

  # Tags for Azure resources
  tags = {
    Terraform     = "true"
    Environment   = "dev"
    Owner         = "test-user"
  }
}
```

## Terraform Usage

To run this example you need to execute following Terraform commands

```
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.
