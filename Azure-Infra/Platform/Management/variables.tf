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

# peering

variable "src_vnet_name" {
  type        = string
  description = "The name of the Source Vnet."
}

variable "src_vnet_id" {
  type        = string
  description = "The ID of the Source Vnet."
}

variable "dest_vnet_name" {
  type        = string
  description = "The name of the Dest Vnet."
}

variable "dest_vnet_id" {
  type        = string
  description = "The name of the Dest Vnet."
}

variable "src_rg_name" {
  type        = string
  description = "The name of the resource group where source Vnet exists."
}

variable "dest_rg_name" {
  type        = string
  description = "The name of the resource group where Dest Vnet exists."
}