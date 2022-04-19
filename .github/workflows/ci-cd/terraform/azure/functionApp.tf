variable "app_service_name" {
    type = string
    default = "alpha-function-app"
}
variable "prefix" {
    type = string
    default = "alphafn"
}

variable "tenant_id" {
    type = string
    default = ""
}

variable "client_id" {
    type = string
    default = ""
}

variable "subscription_id" {
    type = string
    default = ""
}

variable "location" {
    type = string
    default = "eastus"
}

variable "environment" {
    type = string
    default = "preprod"
}

provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  features {}
}

resource "azurerm_resource_group" "alpha" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_storage_account" "alpha" {
  name                     = "${var.prefix}storage"
  resource_group_name      = azurerm_resource_group.alpha.name
  location                 = azurerm_resource_group.alpha.location
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

resource "azurerm_windows_function_app" "alpha" {
  name                       = var.app_service_name
  resource_group_name        = azurerm_resource_group.alpha.name
  location                   = azurerm_resource_group.alpha.location
  storage_account_name       = azurerm_storage_account.alpha.name
  service_plan_id            = azurerm_service_plan.alpha.id
  storage_account_access_key = azurerm_storage_account.alpha.primary_access_key
 
  site_config {}
}

output "function_app_name" {
  value = azurerm_windows_function_app.alpha.name
}