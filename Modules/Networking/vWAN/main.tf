resource "azurerm_virtual_wan" "wan" {
  name                              = var.vwan_name
  resource_group_name               = var.resource_group_name
  location                          = var.location
  disable_vpn_encryption            = var.disable_vpn_encryption
  allow_branch_to_branch_traffic    = var.allow_branch_to_branch_traffic
  office365_local_breakout_category = var.office365_local_breakout_category
  type                              = var.type
  tags                              = var.tags
}

module "vhub" {
  source = "./vHub"

  count = var.vhub == null ? 0 : 1

  resource_group_name = var.resource_group_name
  location            = var.location

  vhub_name                  = var.vhub.name
  virtual_wan_id             = azurerm_virtual_wan.wan.id
  virtual_hub_address_prefix = var.vhub.address_prefix
  virtual_hub_sku            = var.vhub.sku
  virtual_hub_routes         = var.vhub.routes
  tags                       = var.tags
}

/*module "vpn_gateway" {
  source = "./Vpn/VpnGateway"

  count = var.vhub != null && var.vpn_gateway != null ? 1 : 0

  resource_group_name = var.resource_group_name
  location            = var.location

  vpn_gw_name                                       = var.vpn_gateway.name
  virtual_hub_id                                    = module.vhub[0].id
  vpn_gateway_routing_preference                    = var.vpn_gateway.routing_preference
  vpn_gateway_scale_unit                            = var.vpn_gateway.scale_unit
  vpn_gateway_bgp_route_translation_for_nat_enabled = var.vpn_gateway.bgp_route_translation_for_nat_enabled

  vpn_gateway_bgp_asn                        = var.vpn_gateway.bgp_settings.asn
  vpn_gateway_bgp_peer_weight                = var.vpn_gateway.bgp_settings.peer_weight
  vpn_gateway_instance_0_bgp_peering_address = try(var.vpn_gateway.bgp_settings.instance_0_bgp_peering_address, null)
  vpn_gateway_instance_1_bgp_peering_address = try(var.vpn_gateway.bgp_settings.instance_1_bgp_peering_address, null)
  tags                                       = var.tags
  depends_on = [
    module.vhub
  ]
}

module "vpn_sites" {
  source = "./Vpn/VpnSites"

  count = var.vpn_sites != null ? 1 : 0

  resource_group_name = var.resource_group_name
  location            = var.location

  virtual_wan_id = azurerm_virtual_wan.wan.id

  vpn_sites = var.vpn_sites
  tags      = var.tags
}

module "vpn_gw_connections" {
  source = "./Vpn/vpnGwConnection"

  count = var.vpn_gateway != null && var.vpn_sites != null && var.vhub != null ? 1 : 0

  vpn_gateway_name        = module.vpn_gateway[0].vpn_gateway_name
  vpn_gateway_id          = module.vpn_gateway[0].vpn_gateway_id
  vpn_sites               = module.vpn_sites[0].vpn_sites
  vpn_connection_settings = var.vpn_connection_settings

  depends_on = [
    module.vpn_sites,
    module.vpn_gateway
  ]
}
*/