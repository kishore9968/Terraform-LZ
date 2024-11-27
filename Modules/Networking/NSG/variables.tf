variable "nsg_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "location" {
  type        = string
  description = "(optional) describe your variable"
}

variable "resource_group_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "nsg_rules" {
  description = "Additional network security group rules to add. For arguements please refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule#argument-reference"
  default     = {}
}
