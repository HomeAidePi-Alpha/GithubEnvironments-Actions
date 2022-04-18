terraform {
    backend "azurerm" {
        resource_group_name  = var.AZURE_RESOURCE_GROUP_NAME
        storage_account_name = var.AZURE_STORAGE_ACCOUNT_NAME
        container_name       = var.AZURE_STORAGE_CONTAINER_NAME
        key                  = var.AZURE_STORAGE_CONTAINER_NAME_KEY
    }
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "2.42.0"
        }
    }
}
provider "azurerm" {
    features {}
}
 
data "azurerm_client_config" "current" {}
 
#Create Resource Group
resource "azurerm_resource_group" "tamops-rg" {
  name     = var.AZURE_RESOURCE_GROUP
  location = var.AZURE_REGION
}
 
#Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "tamops-vnet"
  address_space       = ["192.168.0.0/16"]
  location            = var.AZURE_REGION
  resource_group_name = azurerm_resource_group.tamops.name
}
 
# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  resource_group_name  = azurerm_resource_group.tamops.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "192.168.0.0/24"
}