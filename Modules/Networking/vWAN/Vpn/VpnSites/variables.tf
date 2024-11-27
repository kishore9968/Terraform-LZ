variable "resource_group_name" {
  description = "Name of the application's resource group."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "virtual_wan_id" {
  description = "ID of the Virtual Wan who hosts the Virtual Hub"
  type        = string
}

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
  default = []
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resources."
  default     = {}
}
