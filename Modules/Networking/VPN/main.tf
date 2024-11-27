module "vpn_gw" {
  source                        = "./vpn-gateway"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  public_ip_allocation_method   = var.public_ip_allocation_method
  public_ip_sku                 = var.public_ip_sku
  gateway_type                  = var.gateway_type
  vpn_type                      = var.vpn_type
  vpn_gw_sku                    = var.vpn_gw_sku
  expressroute_sku              = var.expressroute_sku
  vpn_gw_generation             = var.vpn_gw_generation
  enable_active_active          = var.enable_active_active
  enable_bgp                    = var.enable_bgp
  bgp_asn_number                = var.bgp_asn_number
  bgp_peering_addresses         = var.bgbgp_peering_addresses
  bgp_peer_weight               = var.bgp_peer_weight
  private_ip_address_allocation = var.private_ip_address_allocation
  vpn_client_configuration      = var.vpn_client_configuration
  gw_subnet_id                  = var.gw_subnet_id
  tags                          = var.tags
}


module "local_gw" {
  source              = "./local-gateway"
  resource_group_name = var.resource_group_name
  location            = var.location
  local_networks      = var.local_networks
  local_bgp_settings  = var.local_bgp_settings
  tags                = var.tags
}

module "vpn_connection" {
  source                          = "./vpn-connection"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  local_networks                  = var.local_networks
  vpn_gw_sku                      = var.vpn_gw_sku
  virtual_network_gateway_id      = module.vpn_gw.virtual_network_gateway_id
  virtual_network_gateway_name    = module.vpn_gw.virtual_network_gateway_name
  local_network_gateway_ids       = module.local_gw.local_network_gateway_ids
  local_network_gateway_names     = module.local_gw.local_network_gateway_names
  gateway_connection_type         = var.gateway_connection_type
  express_route_circuit_id        = var.express_route_circuit_id
  peer_virtual_network_gateway_id = var.peer_virtual_network_gateway_id
  gateway_connection_protocol     = var.gateway_connection_protocol
  local_networks_ipsec_policy     = var.local_networks_ipsec_policy
  tags                            = var.tags

  depends_on = [
    module.local_gw,
    module.vpn_gw
  ]
}
