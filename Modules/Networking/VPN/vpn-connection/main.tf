data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {
  subscription_id = data.azurerm_client_config.current.subscription_id
}

locals {
  rg_name_list   = split("-", var.resource_group_name)
  subp_name_list = split("-", data.azurerm_subscription.current.display_name) // Once subpns are setup use data.azurerm_subscription.current.subscription_name

  location_prefix = local.rg_name_list[length(local.rg_name_list) - 2] // Second affix from last is location in resource group name

  is_tt           = local.subp_name_list[0] == "tt" ? true : false
  resource_prefix = local.is_tt == true ? "tt-" : ""

  env = local.subp_name_list[length(local.subp_name_list) - 1]

  resource_postfix = "${local.env}-${local.location_prefix}"
}

resource "azurerm_virtual_network_gateway_connection" "az_onprem" {
  count                           = var.gateway_connection_type == "ExpressRoute" ? 1 : length(var.local_networks)
  name                            = var.gateway_connection_type == "ExpressRoute" ? "localgw-expressroute-connection" : "${var.local_network_gateway_names[count.index]}-to-${var.virtual_network_gateway_name}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  type                            = var.gateway_connection_type
  virtual_network_gateway_id      = var.virtual_network_gateway_id
  local_network_gateway_id        = var.gateway_connection_type != "ExpressRoute" ? var.local_network_gateway_ids[count.index] : null
  express_route_circuit_id        = var.gateway_connection_type == "ExpressRoute" ? var.express_route_circuit_id : null
  peer_virtual_network_gateway_id = var.gateway_connection_type == "Vnet2Vnet" ? var.peer_virtual_network_gateway_id : null
  shared_key                      = var.gateway_connection_type != "ExpressRoute" ? var.local_networks[count.index].shared_key : null
  connection_protocol             = var.gateway_connection_type == "IPSec" && var.vpn_gw_sku == ["VpnGw1", "VpnGw2", "VpnGw3", "VpnGw1AZ", "VpnGw2AZ", "VpnGw3AZ", "VpnGw4AZ", "VpnGw5AZ"] ? var.gateway_connection_protocol : null

  dynamic "ipsec_policy" {
    for_each = var.local_networks_ipsec_policy != null ? [true] : []
    content {
      dh_group         = var.local_networks_ipsec_policy.dh_group
      ike_encryption   = var.local_networks_ipsec_policy.ike_encryption
      ike_integrity    = var.local_networks_ipsec_policy.ike_integrity
      ipsec_encryption = var.local_networks_ipsec_policy.ipsec_encryption
      ipsec_integrity  = var.local_networks_ipsec_policy.ipsec_integrity
      pfs_group        = var.local_networks_ipsec_policy.pfs_group
      sa_datasize      = var.local_networks_ipsec_policy.sa_datasize
      sa_lifetime      = var.local_networks_ipsec_policy.sa_lifetime
    }
  }
  tags = var.tags
}