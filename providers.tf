terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.109.0"
    }
     azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
     random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
  subscription_id = var.az_subscription_id
  tenant_id       = var.az_tenant_id
  client_id       = var.az_client_id
  client_secret   = var.az_client_secret
}