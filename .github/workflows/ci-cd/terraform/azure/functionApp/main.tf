variable "tenant-id" {
    type = string
    default = ""
}

variable "client-id" {
    type = string
    default = ""
}

variable "subscription-id" {
    type = string
    default = ""
}

variable "location" {
    type = string
    default = "eastus"
}

variable "function-app-name" {
    type = string
    default = "alpha-function"
}

variable "resource-group-name" {
    type = string
    default = ""
}

variable "storage-account-name" {
    type = string
    default = ""
}

variable "storage-account-access-key" {
    type = string
    default = ""
}

provider "azurerm" {
  tenant-id       = var.tenant-id
  subscription-id = var.subscription-id
  client-id       = var.client-id
  features {}
}

resource "azurerm-windows-function-app" "alpha" {
  location                   = var.location
  name                       = var.function-app-name
  resource-group-name        = var.resource-group-name
  service-plan-id            = var.service-plan-id
  storage-account-name       = var.storage-account-name
  storage-account-access-key = var.storage-account-access-key
 
  site-config {}
}