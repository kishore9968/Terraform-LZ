variable "vhub_name" {
  type        = string
  description = "The name of the Virtual Hub."
}

variable "remote_virtual_network_name" {
  type        = string
  description = "The name of the remote virtual network."
}

variable "internet_security_enabled" {
  type        = bool
  default     = true
  description = "Enable or disable internet security"
}
variable "remote_virtual_network_id" {
  type        = string
  description = "The Id of the remote virtual network."
}
variable "vnets" {
  type        = any
  description = "(optional) describe your variable"
}
/*variable "remote_hub_rg_name" {
  type        = string
  description = "The Id of the virtual Hub."
}
variable "static_vnet_routes" {
  type        = any
  default     = []
  description = "static routes."
}
variable "ap_route_table_name" {
  type        = string
  description = "static routes."
}*/
variable "virtual_hub_id" {
  type        = string
  description = "Vhub ID"
}


