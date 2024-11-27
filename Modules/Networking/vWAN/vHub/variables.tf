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
  description = "A map of key value pairs to tag the resources."
}

variable "vhub_name" {
  type        = string
  description = "Virutal Hub Name."
}

variable "virtual_wan_id" {
  type        = string
  description = "The ID of a Virtual WAN within which the Virtual Hub should be created"
}

variable "virtual_hub_address_prefix" {
  type        = string
  description = "The Address Prefix which should be used for this Virtual Hub."
}


variable "virtual_hub_sku" {
  description = "The SKU of the Virtual Hub. Possible values are `Basic` and `Standard`"
  type        = string
  default     = "Standard"
}

variable "virtual_hub_routes" {
  description = "List of route blocks. `next_hop_ip_address` values can be `azure_firewall` or an IP address."
  type = list(object({
    address_prefixes    = list(string),
    next_hop_ip_address = string
  }))
  default = []
}