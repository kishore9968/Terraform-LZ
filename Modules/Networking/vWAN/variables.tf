variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "A map of key value pair to tag the resources."
}
variable "vwan_name" {
  type        = string
  description = "Name of the virtual Wan."
}

variable "disable_vpn_encryption" {
  type        = bool
  description = "Boolean flag to specify whether VPN encryption is disabled."
  default     = false
}

variable "allow_branch_to_branch_traffic" {
  type        = bool
  description = "Boolean flag to specify whether branch to branch traffic is allowed."
  default     = true
}

variable "office365_local_breakout_category" {
  type        = string
  default     = "None"
  description = "Specifies the Office365 local breakout category."
}

variable "type" {
  type        = string
  default     = "Standard"
  description = "Specifies the Virtual WAN type"
}

# ----- vHub ------

variable "vhub" {
  type = object({
    name           = string
    address_prefix = string
    sku            = optional(string, "Standard")
    routes = optional(list(object({
      address_prefixes    = list(string),
      next_hop_ip_address = string
    })), [])
  })
  description = "An object to create vHub with the vWan."
  default     = null
}

# ---- VPN Gateway -----
variable "vpn_gateway" {
  type = object({
    name                                  = string
    routing_preference                    = optional(string, "Microsoft Network")
    scale_unit                            = optional(number, 1)
    bgp_route_translation_for_nat_enabled = optional(bool, false)
    bgp_settings = optional(object({
      asn                            = optional(number, 65515)
      peer_weight                    = optional(number, 0)
      instance_0_bgp_peering_address = optional(list(string))
      instance_1_bgp_peering_address = optional(list(string))
      }), {
      asn         = 65515
      peer_weight = 0
    })

  })
  description = "An object to create a Virtual Network Gateway within a vHub."
  default     = null
}


# --- VPN sites -----

variable "vpn_sites" {
  description = "A list of vpn site configurations."
  type = list(object({
    name          = string
    address_cidrs = optional(list(string))
    links = list(object({
      name       = string
      fqdn       = optional(string)
      ip_address = optional(string)
      bgp = optional(list(object({
        asn             = string
        peering_address = string
      })))
      provider_name = optional(string)
      speed_in_mbps = optional(string)
    }))
    device_model  = optional(string)
    device_vendor = optional(string)
    o365_policy = optional(object({
      traffic_category = object({
        allow_endpoint_enabled    = bool
        default_endpoint_enabled  = bool
        optimize_endpoint_enabled = bool
      })
    }))
  }))
  default = null
}

# ---- VPN Connections ----
variable "vpn_connection_settings" {
  description = "VPN Connections configuration for each link within VPN Site."
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
