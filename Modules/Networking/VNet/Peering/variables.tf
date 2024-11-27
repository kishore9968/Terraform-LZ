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