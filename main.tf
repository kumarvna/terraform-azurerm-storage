locals {
    account_tier              = (var.account_kind == "FileStorage" ? "Premium" : split("_", var.sku)[0])
    account_replication_type  = (local.account_tier == "Premium" ? "LRS" : split("_", var.sku)[1])
 
    resource_group_name = element(
    coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)

    location = element(
    coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

data "azurerm_resource_group" "rgrp" {
    count                     = var.create_resource_group == false ? 1 : 0
    name                      = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
    count                     = var.create_resource_group ? 1 : 0
    name                      = var.resource_group_name
    location                  = var.location
    tags                      = merge({"Name" = format("%s", var.resource_group_name)}, var.tags,)
}

resource "azurerm_storage_account" "storeacc" {
    name                      = var.storage_account_name
    resource_group_name       = local.resource_group_name
    location                  = local.location
    account_kind              = var.account_kind
    account_tier              = local.account_tier
    account_replication_type  = local.account_replication_type
    enable_https_traffic_only = var.enable_https_traffic
    tags                      = merge({"Name" = format("%s", var.storage_account_name)}, var.tags,)

    identity {
        type = var.assign_identity ? "SystemAssigned" : null
    } 
}

resource "azurerm_storage_container" "container" {
    count                     = length(var.containers_list)
    name                      = var.containers_list[count.index].name
    storage_account_name      = azurerm_storage_account.storeacc.name
    container_access_type     = var.containers_list[count.index].access_type
}


resource "azurerm_storage_share" "fileshare" {
    count                     = length(var.file_shares)
    name                      = var.file_shares[count.index].name
    storage_account_name      = azurerm_storage_account.storeacc.name
    quota                     = var.file_shares[count.index].quota
}