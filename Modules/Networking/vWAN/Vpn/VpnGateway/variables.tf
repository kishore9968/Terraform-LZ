
variable "resource_group_name" {
  description = "Name of the application's resource group."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}
variable "virtual_hub_id" {
  description = "ID of the Virtual Hub in which to deploy the VPN"
  type        = string
}

variable "vpn_gw_name" {
  type        = string
  description = "The name of the VPN Gateway."
}

variable "vpn_gateway_routing_preference" {
  description = "Azure routing preference. Tou can choose to route traffic either via `Microsoft network` or via the ISP network through public `Internet`"
  type        = string
  default     = "Microsoft Network"
}
variable "vpn_gateway_scale_unit" {
  description = "The scale unit for this VPN Gateway"
  type        = number
  default     = 1
}

variable "vpn_gateway_bgp_route_translation_for_nat_enabled" {
  type        = bool
  description = "bgp route translation for nat enabled"
  default     = false
}

variable "vpn_gateway_bgp_asn" {
  description = "The asn for BGP setting."
  type        = number
  default     = 65515
}

variable "vpn_gateway_bgp_peer_weight" {
  description = "The weight added to Routes learned from this BGP Speaker."
  type        = number
  default     = 0
}

variable "vpn_gateway_instance_0_bgp_peering_address" {
  description = "List of custom BGP IP Addresses to assign to the first instance"
  type        = list(string)
  default     = null
}

variable "vpn_gateway_instance_1_bgp_peering_address" {
  description = "List of custom BGP IP Addresses to assign to the second instance"
  type        = list(string)
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resources."
  default     = {}
}
