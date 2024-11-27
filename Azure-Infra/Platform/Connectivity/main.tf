module "resource_groups" {
  for_each            = var.resource_groups
  source              = "../../../Modules/ResourceGroup"
  resource_group_name = join("-", ["rg","net","conn",var.location_prefix,each.value.name])
  tags                = each.value.tags
  location            = var.location
  #location_prefix     = var.location_prefix local.rg_name_prefix,
}

module "vnet" {
    source = "../../../Modules/Networking/VNet"

    location                    = var.location
    for_each                    = var.vnets
    resource_group_name         = module.resource_groups["001"].name
    # vnet_name                   = each.value.vnet_name
    vnet_name                   = join("-", ["vnet","net","prod","net",var.location_prefix])
    vnet_cidr                   = each.value.vnet_cidr
    #dns_servers                 = each.value.dns_servers
    tags                        = var.tags
    # enable_vhub_connection      = each.value.enable_vhub_connection
    # virtual_hub_id              = try(module.vhub[0].id, null)
    # virtual_hub_name            = try(module.vhub[0].name, null)
    subnets                     = each.value.subnets
    depends_on = [
        module.resource_groups["001"]
    ]
}


/*module "vwan" {
  count                             = var.vwan == {} ? 0 : 1
  source                            = "../../Modules/Networking/vWAN"
  location                          = var.location
  vwan_name                         = local.vwan_name
  resource_group_name               = module.resource_groups["vwan"].name
  disable_vpn_encryption            = lookup(var.vwan, "disable_vpn_encryption", false)
  allow_branch_to_branch_traffic    = lookup(var.vwan, "allow_branch_to_branch_traffic", false)
  office365_local_breakout_category = lookup(var.vwan, "office365_local_breakout_category", "None")
  tags                              = var.tags
  type                              = var.vwan.type
}

module "vhub" {
  count                      = var.vhub == {} ? 0 : 1
  source                     = "../../Modules/Networking/vWAN/vHub"
  virtual_wan_id             = module.vwan[0].vwan_id
  vhub_name                  = local.vhub_name
  resource_group_name        = module.resource_groups["vhub"].name
  virtual_hub_address_prefix = var.vhub.address_prefix
  virtual_hub_sku            = var.vhub.sku
  tags                       = var.tags
  location                   = var.location
}
*/
# module "vhub_connections" {
#   for_each = local.vhub_connections_map
#   source              = "../../Modules/Networking/vWAN/vHub/vHubConnection"
#   remote_virtual_network_id = each.value.vnet_id
#   virtual_hub_id            = module.vhub[0].id
#   vhub_name = module.vhub[0].name
#   remote_virtual_network_name = each.value.vnet_name
  
# }


module "vpn" {
  source                        = "../../../Modules/Networking/VPN"
  resource_group_name           = module.resource_groups["001"].name
  location                      = var.location
  public_ip_allocation_method   = var.vpn.public_ip_allocation_method
  public_ip_sku                 = var.vpn.public_ip_sku
  gateway_type                  = var.vpn.gateway_type
  vpn_type                      = var.vpn.vpn_type
  vpn_gw_sku                    = var.vpn.vpn_gw_sku
  #expressroute_sku              = var.expressroute_sku
  vpn_gw_generation             = var.vpn.vpn_gw_generation
  enable_active_active          = var.enable_active_active
  enable_bgp                    = var.enable_bgp
  bgp_asn_number                = var.bgp_asn_number
  bgp_peer_weight               = var.bgp_peer_weight
  private_ip_address_allocation = var.private_ip_address_allocation
  vpn_client_configuration      = var.vpn_client_configuration
  #gw_subnet_id                  = module.vnet["net"].snet["vnet-001.0.gateway-snet"]
  gw_subnet_id                  = module.vnet["con"].snets["vnet-net-prod-net-eus2.0.GatewaySubnet"]
  tags                          = var.tags
  local_networks                = var.vpn.local_networks
  #local_bgp_settings            = var.local_bgp_settings
  depends_on = [
        module.vnet
    ]
  
}

