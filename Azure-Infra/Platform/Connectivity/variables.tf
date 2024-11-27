variable "subscription_id" {
  type        = string
  description = "(optional) describe your variable"
}
variable "connectivity_subscription_id" {
  type        = string
  description = "(optional) describe your variable"
}

variable "resource_groups" {
  default     = {}
  description = "(optional) describe your variable"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
}

variable "location_prefix" {
  type        = string
  description = "(optional) describe your variable"
}
variable "project_name_prefix" {
  type        = string
  description = "(optional) describe your variable"

}

variable "tags" {
  type        = map(any)
  description = "(optional) describe your variable"
}
variable "vnets" {
  type        = any
  description = "(optional) describe your variable"
}

/*variable "vwan" {
  default     = {}
  description = "(optional) describe your variable"
}

variable "vhub" {
  default     = {}
  description = "(optional) describe your variable"
}
# variable "vnet_name" {
#   description = "The name of the virtual network."
#   type        = string

# }
# variable "vnet_count" {
#   description = "VNet count"
#   type        = number
#   default     = 1
# }

#vpn*/

variable "vpn" {
  type        = any
  description = "(optional) describe your variable"
}


# variable "vpn" {
#   type = map(object({
#     public_ip_allocation_method = string
#     public_ip_sku               = string
#     gateway_type                = string
#     vpn_type                    = string
#     vpn_gw_sku                  = string
#     vpn_gw_generation           = string
#     local_networks              = list(object({ local_gateway_address = string, local_address_space = list(string), shared_key = string }))
#   }))
# }

variable "public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic"
  default     = "Dynamic"
  type        = string
}

variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic"
  default     = "Basic"
  type        = string
}

variable "gateway_type" {
  description = "The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute"
  default     = "Vpn"
  type        = string
}

variable "vpn_type" {
  description = "The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased"
  default     = "RouteBased"
  type        = string
}

variable "vpn_gw_sku" {
  description = "Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments"
  default     = "VpnGw1"
  type        = string
}

variable "expressroute_sku" {
  description = "Configuration of the size and capacity of the virtual network gateway for ExpressRoute type. Valid options are Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ and depend on the type, vpn_type and generation arguments"
  default     = "Standard"
  type        = string
}

variable "vpn_gw_generation" {
  description = "The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None"
  default     = "Generation1"
  type        = string
}

variable "enable_active_active" {
  description = "If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false."
  default     = false
  type        = bool
}

variable "enable_bgp" {
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false"
  default     = false
  type        = bool
}

variable "bgp_asn_number" {
  description = "The Autonomous System Number (ASN) to use as part of the BGP"
  default     = "65515"
  type        = number
}

variable "bgbgp_peering_addresses" {
  description = "The BGP peer IP address of the virtual network gateway. This address is needed to configure the created gateway as a BGP Peer on the on-premises VPN devices. The IP address must be part of the subnet of the Virtual Network Gateway."
  default     = []
  type        = list(object({ ip_configuration_name = string, apipa_addresses = list(string) }))
}

variable "bgp_peer_weight" {
  description = "The weight added to routes which have been learned through BGP peering. Valid values can be between 0 and 100"
  default     = ""
  type        = string
}

variable "private_ip_address_allocation" {
  type        = string
  default     = "Dynamic"
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic"
}

variable "vpn_client_configuration" {
  type        = object({ address_space = string, certificate = string, vpn_client_protocols = list(string) })
  description = "Virtual Network Gateway client configuration to accept IPSec point-to-site connections"
  default     = null
}
/*variable "gw_subnet_id" {
  type        = string
  description = "GatewaySubnet Id "
}*/



# uncomment
variable "local_networks" {
  type        = list(object({ local_gateway_address = string, local_address_space = list(string), shared_key = string }))
  description = "List of local virtual network connections to connect to gateway"
  default     = []
}

variable "local_bgp_settings" {
  type        = list(object({ asn_number = number, peering_address = string, peer_weight = number }))
  description = "Local Network Gateway's BGP speaker settings"
  default     = null
}
variable "gateway_connection_type" {
  description = "The type of connection. Valid options are IPsec (Site-to-Site), ExpressRoute (ExpressRoute), and Vnet2Vnet (VNet-to-VNet)"
  default     = "IPsec"
}

variable "express_route_circuit_id" {
  description = "The ID of the Express Route Circuit when creating an ExpressRoute connection"
  default     = null
}

variable "peer_virtual_network_gateway_id" {
  description = "The ID of the peer virtual network gateway when creating a VNet-to-VNet connection"
  default     = null
}

variable "gateway_connection_protocol" {
  description = "The IKE protocol version to use. Possible values are IKEv1 and IKEv2. Defaults to IKEv2"
  default     = "IKEv2"
}

variable "local_networks_ipsec_policy" {
  description = "IPSec policy for local networks. Only a single policy can be defined for a connection."
  default     = null
}
