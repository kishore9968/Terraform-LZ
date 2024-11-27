variable "resource_group_name" {
  type        = string
  description = "(optional) describe your variable"
}
variable "location" {
  type        = string
  description = "(optional) describe your variable"
}

variable "local_networks" {
  type        = list(object({ local_gateway_address = string,local_address_space = list(string) , shared_key = string }))
  description = "List of local virtual network connections to connect to gateway"
  default     = []
}
#

variable "local_bgp_settings" {
  type        = list(object({ asn_number = number, peering_address = string, peer_weight = number }))
  description = "Local Network Gateway's BGP speaker settings"
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}