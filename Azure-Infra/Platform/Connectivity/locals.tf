data "azurerm_subscription" "current" {}

data "azurerm_client_config" "current" {}

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
gateway_snet = [for s in module.vnet["con"].snet : s if s.subnet_name == "GatewaySubnet"][0]
   
}



locals {
  gateway_subnet_id = try(
    [
      for k, v in module.vnet.subnet_name_and_id : v.id
      if k == "emo-poc-eus-int-Trial-gateway-snet"
    ][0],
    null // Handle the case where the subnet does not exist
  )
}