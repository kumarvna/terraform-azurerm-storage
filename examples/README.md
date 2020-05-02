# Azure Storage Account creation with additional Resources

Configuration in this directory creates a set of Azure storage resources. Few of these resources added/excluded as per your requirement.

## Configure the Azure Provider

Add AzureRM provider to start with the module configuration. Whilst the `version` attribute is optional, we recommend, not to pinning to a given version of the Provider.

## Create resource group

By default, this module will not create a resource group and the name of an existing resource group to be given in an argument `create_resource_group`. If you want to create a new resource group, set the argument `create_resource_group = true`.

*If you are using an existing resource group, then this module uses the same resource group location to create all resources in this module.*

## Tagging

Use tags to organize your Azure resources and management hierarchy. You can apply tags to your Azure resources, resource groups, and subscriptions to logically organize them into a taxonomy. Each tag consists of a name and a value pair. For example, you can apply the name "Environment" and the value "Production" to all the resources in production. You can manage these values variables directly or mapping as a variable using `variables.tf`.

All Azure resources which support tagging can be tagged by specifying key-values in argument `tags`. Tag Name is added automatically on all resources. For example, you can specify `tags` like this:

```
module "storage" {
  source        = "kumarvna/storage/azurerm"
  version       = "1.0.0"

  # ... omitted

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "test-user"
  }
}  
```

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

## SMB File Shares

Following example to create a storage account with few SMB files shares.

```
module "storage" {
  source                  = "kumarvna/storage/azurerm"
  version                 = "1.0.0"

  # Resource Group
  create_resource_group   = true
  resource_group_name     = "rg-demo-westeurope-01"
  location                = "westeurope"
  storage_account_name    = "storageaccwesteupore01"

# SMB file share with quota (GB) to create
  file_shares = [
    { name  = "smbfileshare1"
      quota = 50 },
    { name  = "smbfileshare2"
      quota = 50 }
  ]

# Tags for Azure resources
  tags = {
    Terraform     = "true"
    Environment   = "dev"
    Owner         = "test-user"
  }
}
```

## Storage Account with all additional features

Following example to create a storage account with containers and and SMB file shares resources.

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

  # SMB file share with quota (GB) to create
  file_shares = [
        { name   = "smbfileshare1"
        quota    = 50 },
        { name   = "smbfileshare2"
        quota    = 50 }
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

## Outputs

Name | Description
---- | -----------
`resource_group_name` | The name of the resource group in which resources are created
`resource_group_id` | The id of the resource group in which resources are created
`resource_group_location`| The location of the resource group in which resources are created
`storage_account_id` | The ID of the storage account
`sorage_account_name`| The name of the storage account
`storage_primary_connection_string`|The primary connection string for the storage account
`storage_primary_access_key`|The primary access key for the storage account
`containers` | The list of containers
`file_shares` | The list of SMB file shares