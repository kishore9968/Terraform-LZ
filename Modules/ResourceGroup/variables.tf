
variable "location" {
  description = "The Azure region where the resource group will be created. Examples include 'East US 2', 'West US 2', etc. This determines the physical location of your resources."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name."
  type        = string
}

variable "tags" {
  default     = {}
  description = "(optional) describe your variable"
}