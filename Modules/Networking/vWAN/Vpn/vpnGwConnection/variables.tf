variable "vpn_gateway_name" {
  type        = string
  description = "Name of VPN gateway."
}
variable "vpn_gateway_id" {
  type        = string
  description = "ID of VPN gateway."
}
variable "vpn_sites" {
  type        = list(any)
  description = "List Ids of vpn sites and corresponding id of vpn links."
}

variable "vpn_connection_settings" {
  description = "VPN Connections configuration for each links."
  type = list(object({
    internet_security_enabled = optional(bool)
    link_config = list(object({
      egress_nat_rule_ids  = optional(list(string))
      ingress_nat_rule_ids = optional(list(string))
      bandwidth_mbps       = optional(number)
      bgp_enabled          = optional(bool)
      connection_mode      = optional(string)
      ipsec_policy = optional(object({
        dh_group                 = string
        ike_encryption_algorithm = string
        ike_integrity_algorithm  = string
        encryption_algorithm     = string
        integrity_algorithm      = string
        pfs_group                = string
        sa_data_size_kb          = number
        sa_lifetime_sec          = number
      }))
      protocol                              = optional(string)
      ratelimit_enabled                     = optional(bool)
      route_weight                          = optional(number)
      shared_key                            = optional(string)
      local_azure_ip_address_enabled        = optional(bool)
      policy_based_traffic_selector_enabled = optional(bool)
    }))
  }))
  default = []
}
