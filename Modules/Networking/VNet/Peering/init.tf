terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~>3.23"
      # configuration_aliases = [azurerm.con]
    }
  }
}