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

  resource_postfix = replace("${local.env}-${local.location_prefix}", "/\\s+/", "")

}

resource "azurerm_local_network_gateway" "localgw" {
  count               = length(var.local_networks)
  name                = "${local.resource_prefix}gw-local-${local.resource_postfix}-00${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  gateway_address     = var.local_networks[count.index].local_gateway_address
  address_space       = var.local_networks[count.index].local_address_space

  dynamic "bgp_settings" {
    for_each = var.local_bgp_settings != null ? [true] : []
    content {
      asn                 = var.local_bgp_settings[count.index].asn_number
      bgp_peering_address = var.local_bgp_settings[count.index].peering_address
      peer_weight         = var.local_bgp_settings[count.index].peer_weight
    }
  }
  tags = var.tags
}

output "local_network_gateway_ids" {
  value = azurerm_local_network_gateway.localgw[*].id
}
output "local_network_gateway_names" {
  value = azurerm_local_network_gateway.localgw[*].name
}