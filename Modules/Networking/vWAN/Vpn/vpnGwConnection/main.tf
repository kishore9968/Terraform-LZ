locals {

  vpn_site_config = [
    for i in range(length(var.vpn_sites)) :
    {
      remote_vpn_site_id        = var.vpn_sites[i].id
      name                      = replace("cn-colo${i + 1}-to-${var.vpn_gateway_name}", "/\\s+/", "")
      internet_security_enabled = lookup(try(var.vpn_connection_settings[i], {}), "internet_security_enabled", false)
      vpn_links = [
        for link in range(length(var.vpn_sites[i].links)) : {
          name                                  = replace("cnlnk-colo${i + 1}-to-${var.vpn_gateway_name}", "/\\s+/", "")
          vpn_site_link_id                      = var.vpn_sites[i].links[link].id
          egress_nat_rule_ids                   = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "egress_nat_rule_ids", null)
          ingress_nat_rule_ids                  = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "ingress_nat_rule_ids", null)
          bandwidth_mbps                        = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "bandwidth_mbps", null)
          bgp_enabled                           = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "bgp_enabled", null)
          connection_mode                       = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "connection_mode", null)
          ipsec_policy                          = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "ipsec_policy", null)
          protocol                              = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "protocol", null)
          ratelimit_enabled                     = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "ratelimit_enabled", null)
          route_weight                          = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "route_weight", null)
          shared_key                            = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "shared_key", null)
          local_azure_ip_address_enabled        = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "local_azure_ip_address_enabled", null)
          policy_based_traffic_selector_enabled = lookup(try(var.vpn_connection_settings[i].link_config[link], {}), "policy_based_traffic_selector_enabled", null)
        }
      ]
    }
  ]
}

resource "azurerm_vpn_gateway_connection" "vpn_gateway_connection" {
  count                     = length(local.vpn_site_config)
  name                      = local.vpn_site_config[count.index].name
  remote_vpn_site_id        = local.vpn_site_config[count.index].remote_vpn_site_id
  vpn_gateway_id            = var.vpn_gateway_id
  internet_security_enabled = lookup(local.vpn_site_config[count.index], "internet_security_enabled", false)

  dynamic "vpn_link" {
    for_each = toset(local.vpn_site_config[count.index].vpn_links)
    content {
      name                 = vpn_link.value.name
      vpn_site_link_id     = vpn_link.value.vpn_site_link_id
      egress_nat_rule_ids  = vpn_link.value.egress_nat_rule_ids
      ingress_nat_rule_ids = vpn_link.value.ingress_nat_rule_ids
      bandwidth_mbps       = vpn_link.value.bandwidth_mbps
      bgp_enabled          = vpn_link.value.bgp_enabled
      connection_mode      = vpn_link.value.connection_mode

      dynamic "ipsec_policy" {
        for_each = lookup(vpn_link.value, "ipsec_policy", null) != null ? [true] : []
        content {
          dh_group                 = vpn_link.value.ipsec_policy.dh_group
          encryption_algorithm     = vpn_link.value.ipsec_policy.encryption_algorithm
          ike_encryption_algorithm = vpn_link.value.ipsec_policy.ike_encryption_algorithm
          ike_integrity_algorithm  = vpn_link.value.ipsec_policy.ike_integrity_algorithm
          integrity_algorithm      = vpn_link.value.ipsec_policy.integrity_algorithm
          pfs_group                = vpn_link.value.ipsec_policy.pfs_group
          sa_data_size_kb          = vpn_link.value.ipsec_policy.sa_data_size_kb
          sa_lifetime_sec          = vpn_link.value.ipsec_policy.sa_lifetime_sec
        }
      }
      protocol                              = vpn_link.value.protocol
      ratelimit_enabled                     = vpn_link.value.ratelimit_enabled
      route_weight                          = vpn_link.value.route_weight
      shared_key                            = vpn_link.value.shared_key
      local_azure_ip_address_enabled        = vpn_link.value.local_azure_ip_address_enabled
      policy_based_traffic_selector_enabled = vpn_link.value.policy_based_traffic_selector_enabled
    }
  }

  lifecycle {
    ignore_changes = [vpn_link] // Manual changes done to the connection will be reverted and vpn_link won't work.  
  }
}
