provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = var.subscription_id
}
 provider "azurerm" {
   features {}
   subscription_id = var.connectivity_subscription_id
   alias           = "net"
 }