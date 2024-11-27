resource "azurerm_vpn_gateway" "vpn" {
  name                = var.vpn_gw_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = var.virtual_hub_id

  routing_preference                    = var.vpn_gateway_routing_preference
  scale_unit                            = var.vpn_gateway_scale_unit
  bgp_route_translation_for_nat_enabled = var.vpn_gateway_bgp_route_translation_for_nat_enabled

  bgp_settings {
    asn         = var.vpn_gateway_bgp_asn
    peer_weight = var.vpn_gateway_bgp_peer_weight

    dynamic "instance_0_bgp_peering_address" {
      for_each = var.vpn_gateway_instance_0_bgp_peering_address != null ? [true] : []
      content {
        custom_ips = var.vpn_gateway_instance_0_bgp_peering_address
      }
    }

    dynamic "instance_1_bgp_peering_address" {
      for_each = var.vpn_gateway_instance_1_bgp_peering_address != null ? [true] : []
      content {
        custom_ips = var.vpn_gateway_instance_1_bgp_peering_address
      }
    }
  }

  tags = var.tags
}