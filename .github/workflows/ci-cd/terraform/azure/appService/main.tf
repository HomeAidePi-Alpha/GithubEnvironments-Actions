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

variable "service-plan-name" {
  type    = string
  default = ""
}

variable "storage-account-name" {
  type    = string
  default = ""
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

provider "azurerm" {
  features {}
  subscription-id = var.subscription-id
  tenant-id       = var.tenant-id
  client-id       = var.client-id
}

resource "azurerm_resource_group" "alpha" {
  name     = var.resource-group-name
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
  name                = var.service-plan-name
  resource-group-name = var.resource-group-name
  location            = var.location
  os-type             = "Windows"
  sku-name            = "Y1"
}

output "storage_account_access_key" {
  value = azurerm_storage_account.main.primary_access_key
}
