variable "web-app-name" {
    type = string
    default = "alpha-web-app"
}

variable "resource-group-name" {
    type = string
    default = "resource-group-name"
}

variable "location" {
    type = string
    default = "eastus"
}

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

variable "service-plan-id" {
    type = string
    default = ""
}

provider "azurerm" {
  tenant-id       = var.tenant-id
  subscription-id = var.subscription-id
  client-id       = var.client-id
  features {}
}

resource "azurerm-windows-web-app" "alpha" {
  name                = var.web-app-name
  resource-group-name = var.resource-group-name
  location            = var.location
  service-plan-id     = var.service-plan-id

  site-config {}
}
