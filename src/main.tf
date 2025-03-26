# Azure provider setup
provider "azurerm" {
  features {}

  # SPN (Service Principal) details
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# Resource group create 
resource "azurerm_resource_group" "example" {
  name     = "my-static-site-rg"
  location = "eastus2"
}

# static web app 
resource "azurerm_static_site" "example" {
  name                = "my-static-site-123" 
  resource_group_name = azurerm_resource_group.example.name
  location            = "eastus2"
}