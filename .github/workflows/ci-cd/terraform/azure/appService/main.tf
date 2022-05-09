variable "tenant-id" {
  type    = string
  default = ""
}

variable "client-id" {
  type    = string
  default = ""
}

variable "subscription-id" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "resource-group-name" {
  type    = string
  default = ""
}

variable "storage-account-name" {
  type    = string
  default = ""
}

variable "storage-account-access-key" {
  type    = string
  default = ""
}

variable "prefix" {
  type    = string
  default = "alpha-pre"
}

provider "azurerm" {
  tenant_id       = var.tenant-id
  subscription_id = var.subscription-id
  client_id       = var.client-id
  features {}
}

resource "azurerm_resource_group" "alpha" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_storage_account" "alpha" {
  name                     = var.storage-account-name
  resource_group_name      = var.resource-group-name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "alpha" {
  name                = "${var.prefix}-app-service-plan"
  resource_group_name = azurerm_resource_group.alpha.name
  location            = azurerm_resource_group.alpha.location
  os_type             = "Windows"
  sku_name            = "Y1"
}
