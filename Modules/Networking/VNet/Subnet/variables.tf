variable "location" {
  type        = string
  default     = "eastus"
  description = "Location for network security group"
}

variable "subnet_name" {
  description = "Subnet name to use"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual network name"
  type        = string
}

variable "subnet_cidr_list" {
  description = "The address prefix list to use for the subnet"
  type        = list(string)
}

variable "route_table_name" {
  description = "The Route Table name to associate with the subnet"
  type        = string
  default     = null
}

variable "route_table_rg" {
  description = "The Route Table RG to associate with the subnet. Default is the same RG than the subnet."
  type        = string
  default     = null
}

variable "network_security_group_name" {
  description = "The Network Security Group name to associate with the subnets"
  type        = string
  default     = null
}

variable "network_security_group_rg" {
  description = "The Network Security Group RG to associate with the subnet. Default is the same RG than the subnet."
  type        = string
  default     = null
}

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet"
  type        = list(string)
  default     = []
}

variable "private_endpoint_network_policies_enabled" {
  description = "Enable or Disable network policies for the private endpoint on the subnet"
  type        = bool
  default     = true
}

variable "private_link_service_network_policies_enabled" {
  type        = bool
  default     = true
  description = "Enable or Disable service network policies for the private endpoint on the subnet"
}

variable "subnet_delegation" {
  description = <<EOD
      Configuration delegations on subnet
      object({
        name = object({
          name = string,
          actions = list(string)
        })
      })
  EOD
  type        = map(list(any))
  default     = {}
}


variable "tags" {
  type        = map(any)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "network_security_group_id" {
  type        = string
  description = "Network security group ID"
  default     = null
}

variable "route_table_id" {
  type        = string
  default     = null
  description = "Id of the route table."
}

variable "network_security_group_rules" {
  default     = {}
  description = "Map containging Network security group rules."
}
