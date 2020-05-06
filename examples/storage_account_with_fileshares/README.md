# Azure Storage Account creation with additional Resources

Configuration in this directory creates a set of Azure storage resources. Few of these resources added/excluded as per your requirement.

## Module Usage

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

## Terraform Usage

To run this example you need to execute following Terraform commands

```
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.
