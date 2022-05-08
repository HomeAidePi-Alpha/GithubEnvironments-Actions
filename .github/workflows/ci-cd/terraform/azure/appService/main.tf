variable "tenant_id" {
}
variable "subscription_id" {
}
variable "location" {
}
variable "resource_group_name" {
}
variable "service_plan_name" {
}
variable "storage_account_name" {
}

terraform {
  backend "azurerm" {
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

provider "azurerm" {
  features {}

  
}

resource "azurerm_resource_group" "alpha" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "alpha" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "alpha" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

output "storage-account-access-key" {
  value = azurerm_storage_account.alpha.primary_access_key
}
