variable "tenant-id" {
  type    = string
  default = ""
}

variable "client-id" {
  type    = string
  default = ""
}

variable "client-secret" {
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

  subscription_id = var.subscription-id
  client_id       = var.client-id
  client_secret   = var.client_secret
  tenant_id       = var.tenant-id
}

resource "azurerm_resource_group" "alpha" {
  name     = var.resource-group-name
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
  name                = var.service-plan-name
  resource_group_name = var.resource-group-name
  location            = var.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

output "storage-account-access-key" {
  value = azurerm_storage_account.alpha.primary_access_key
}
