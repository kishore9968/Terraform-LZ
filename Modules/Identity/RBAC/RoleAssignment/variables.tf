variable "principal_ids" {
  type        = list(string)
  description = "List of IDs of the Principal (User, Group or Service Principal) to assign the Role Definition to."
}

variable "role_definition_name" {
  type        = string
  description = "The name of a built-in Role"
  default     = null
}

variable "role_definition_id" {
  type        = string
  description = "(optional) describe your variable"
  default     = null
}

variable "scope" {
  type        = string
  description = "(optional) describe your variable"
}
