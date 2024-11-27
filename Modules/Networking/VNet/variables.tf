variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string

}
variable "vnet_count" {
  description = "VNet count"
  type        = number
  default     = 1
}

variable "location" {
  description = "The location/region where the virtual network is created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_cidr" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers"
  type        = list(string)
  default     = []
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "subnets" {
  description = "Subnet object with required parameters. If you have existing nsg created, pass the name of nsg. Otherwise pass the nsg rules it will create a nsg and associate it to the subnet."
  default     = []
  type = list(object({
    subnet_name                  = string
    subnet_cidr_list             = list(string)
    network_security_group_name  = optional(string)
    network_security_group_rules = optional(any)
  }))
}


variable "enable_vhub_connection" {
  type        = bool
  default     = false
  description = "(optional) describe your variable"
}
variable "virtual_hub_name" {
  type        = string
  default     = null
  description = "(optional) describe your variable"
}

variable "virtual_hub_id" {
  type        = string
  default     = null
  description = "(optional) describe your variable"
}