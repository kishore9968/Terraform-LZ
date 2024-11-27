provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = var.subscription_id
  alias           = "iden"
}

provider "azurerm" {
  features {}
  subscription_id = var.connectivity_subscription_id
  alias           = "con"
}

provider "azurerm" {
  features {
    
  }
  subscription_id = var.subscription_id
}