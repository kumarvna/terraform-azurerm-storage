variable "create_resource_group" {
    description = "Whether to create resource group and use it for all networking resources"
    default     = false
}

variable "resource_group_name" {
    description = "A container that holds related resources for an Azure solution"
    default     = "rg-demo-westeurope-01"
}

variable "location" {
    description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
    default     = "westeurope"
}

variable "storage_account_name" {
    description = "The name of the storage account to be created"
    default     = ""
}

variable "account_kind" {
  default     = "StorageV2"
  description = "The kind of storage account."
}

variable "sku" {
  default     = "Standard_GRS"
  description = "The SKU of the storage account."
}

variable "access_tier" {
  default     = "Hot"
  description = "The access tier of the storage account."
}

variable "enable_https_traffic" {
  default     = true
  description = "Set to `true` to allow HTTPS traffic, or `false` to disable it."
}

variable "assign_identity" {
  default     = true
  description = "Set to `true` to enable system-assigned managed identity, or `false` to disable it."
}

variable "containers_list" {
  type = list(object({
    name        = string
    access_type = string
  }))
  default     = []
  description = "List of storage containers."
}

variable "file_shares" {
  type = list(object({
    name  = string
    quota = number
  }))
  default     = []
  description = "List of storage SMB File shares."
}

variable "tags" {
    description = "A map of tags to add to all resources"
    type        =  map(string)
    default     = {}
}