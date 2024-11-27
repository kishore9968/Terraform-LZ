terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.23"
      #subscription_id = var.net
    }
  }
}