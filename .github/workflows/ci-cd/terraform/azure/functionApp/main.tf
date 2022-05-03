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

provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  features {}
}

resource "azurerm_windows_function_app" "alpha" {
  location                   = var.location
  name                       = var.function_app_name
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
 
  site_config {}
}