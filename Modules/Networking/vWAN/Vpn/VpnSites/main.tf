resource "azurerm_vpn_site" "vpn_site" {
  count               = length(var.vpn_sites)
  name                = var.vpn_sites[count.index].name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = var.virtual_wan_id
  address_cidrs       = lookup(var.vpn_sites[count.index], "address_cidrs", [])

  dynamic "link" {
    for_each = var.vpn_sites[count.index].links
    content {
      name       = link.value.name
      fqdn       = link.value.fqdn
      ip_address = link.value.ip_address

      dynamic "bgp" {
        for_each = link.value.bgp != null ? link.value.bgp : []
        content {
          asn             = bgp.value.asn
          peering_address = bgp.value.peering_address
        }
      }
      provider_name = lookup(link.value, "provider_name", null)
      speed_in_mbps = lookup(link.value, "speed_in_mbps", null)
    }
  }

  device_model  = lookup(var.vpn_sites[count.index], "device_model", null)
  device_vendor = lookup(var.vpn_sites[count.index], "device_vendor", null)

  dynamic "o365_policy" {
    for_each = lookup(var.vpn_sites[count.index], "o365_policy", null) == null ? [] : [true]
    content {
      traffic_category {
        allow_endpoint_enabled    = lookup(var.vpn_sites[count.index].o365_policy, "allow_endpoint_enabled", null)
        default_endpoint_enabled  = lookup(var.vpn_sites[count.index].o365_policy, "default_endpoint_enabled", null)
        optimize_endpoint_enabled = lookup(var.vpn_sites[count.index].o365_policy, "optimize_endpoint_enabled", null)

      }
    }
  }
  tags = var.tags
}
