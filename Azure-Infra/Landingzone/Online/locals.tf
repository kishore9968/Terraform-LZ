data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

# data "azurerm_virtual_network" "connectivity_vnet" {
#   provider            = azurerm.con
#   name                = "vnet-net-prod-net-eus2-001"
#   resource_group_name = "rg-net-conn-eus2-001"
# }

# data "azurerm_virtual_network" "connectivity_vnet" {
#   provider            = azurerm.con
#   name                = "kishore-vnet"
#   resource_group_name = "kishore-dww-RG"
# }

data "terraform_remote_state" "conn" {
  backend = "azurerm"
  config = {
    subscription_id      = "4a39f866-aa63-4c0a-9a96-369a6edfdd93"
    resource_group_name  = "Dww-migrate-RG"
    storage_account_name = "dwwsastatefile"
    container_name       = "terraform-state"
    key                  = "AzureInfra/Platform/connectivity/terraform.tfstate"   

  }
}


locals {
  subp_name_list        = split("-", data.azurerm_subscription.current.display_name) // Once subpns are setup use data.azurerm_subscription.current.subscription_name
  prefix_removed_list   = slice(local.subp_name_list, 1, length(local.subp_name_list))
  prefix_removed_string = join("-", local.prefix_removed_list)

  common_prefix       = join("-", [var.project_name_prefix, var.location_prefix, "int"])
  subscription_prefix = local.prefix_removed_string

  #rg_name_prefix = join("-", [local.common_prefix, local.subscription_prefix])
  vnet_name_prefix = join("-", [local.common_prefix, local.subscription_prefix])

  #vwan_name = join("-", [local.common_prefix, var.vwan.vwan_name])
  #vhub_name = join("-", [local.common_prefix, var.vhub.vhub_name])
#local.subscription_prefix
 
#  vhub_connections = [
#     for count in range(lenght(var.vnets) ) : {
#       vnet_name = azurerm_virtual_network.vnets[count].name
#       vnet_id   = azurerm_virtual_network.vnets[count].id
#     }
#   ]

#   vhub_connections_map = { for obj in local.vhub_connections : obj.vnet_name => obj.vnet_id }
# gateway_snet = [for s in module.vnet["net"].snet : s if s.subnet_name == "GatewaySubnet"][0]
   
}



