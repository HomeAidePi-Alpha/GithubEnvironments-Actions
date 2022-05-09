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
  tenant-id       = var.tenant-id
  subscription-id = var.subscription-id
  client-id       = var.client-id
  features {}
}

resource "azurerm_resource_group" "alpha" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_storage_account" "alpha" {
  name                     = var.storage-account-name
  resource-group-name      = var.resource-group-name
  location                 = var.location
  account-tier             = "Standard"
  account-replication-type = "LRS"
}

resource "azurerm_service_plan" "alpha" {
  name                = "${var.prefix}-app-service-plan"
  resource-group-name = azurerm_resource_group.alpha.name
  location            = azurerm_resource_group.alpha.location
  os-type             = "Windows"
  sku-name            = "Y1"
}
