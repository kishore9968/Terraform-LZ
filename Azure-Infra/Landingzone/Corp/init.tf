terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.23"
    }
  }
 }

terraform {
  backend "azurerm" {
    resource_group_name  = "Dww-migrate-RG"
    storage_account_name = "dwwsastatefile"
    container_name       = "terraform-state"
    key                  = "AzureInfra/Landingzone/corp/terraform.tfstate"
    subscription_id      = "4a39f866-aa63-4c0a-9a96-369a6edfdd93"
    tenant_id            = "99f1e6b1-dac6-4b0c-bb52-45ff9b5e7ef7"
  }
}

