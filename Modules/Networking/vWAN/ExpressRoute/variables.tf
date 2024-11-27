variable "resource_group_name" {
  type        = string
  description = "(optional) describe your variable"
}
variable "location" {
  type        = string
  description = "(optional) describe your variable"
}
variable "er_circuit_name" {
  type        = string
  description = "(optional) describe your variable"
}
variable "service_provider_name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "Equinix"
}
variable "peering_location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "Silicon Valley"
}
variable "bandwidth_in_mbps" {
  type        = number
  description = "(optional) describe your variable"
  default     = 50
}

variable "sku_tier" {
  type        = string
  description = "(optional) describe your variable"
  default     = "Standard"
}
variable "sku_family" {
  type        = string
  description = "(optional) describe your variable"
  default     = "MeteredData"
}

variable "er_gateway_name" {
  type        = string
  description = "(optional) describe your variable"
}
variable "virtual_hub_id" {
  type        = string
  description = "(optional) describe your variable"
}
variable "er_gateway_scale_units" {
  type        = number
  description = "(optional) describe your variable"
  default     = 1
}

variable "tags" {
  type        = map(string)
  description = "(optional) describe your variable"
  default     = {}
}