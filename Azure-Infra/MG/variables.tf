variable "prefix" {
  type = string
}

variable "tenant_prefix" {
  type        = string
  description = "(optional) describe your variable"
  default     = ""
}

variable "dynamic_connectivity_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "dynamic_corp_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "dynamic_identity_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "dynamic_management_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "dynamic_online_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

/*
# variable "infra_np_subs" {
#   type        = list(string)
#   description = "(optional) describe your variable"
# }

variable "infra_pr_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

# variable "sec_np_subs" {
#   type        = list(string)
#   description = "(optional) describe your variable"
# }
variable "sec_pr_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

# variable "cor_np_subs" {
#   type        = list(string)
#   description = "(optional) describe your variable"
# }
variable "cor_pr_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

# variable "net_np_subs" {
#   type        = list(string)
#   description = "(optional) describe your variable"
# }
variable "net_pr_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}
variable "cp_np_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}
variable "cp_pr_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "sb_cp_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}
variable "sb_ol_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "ol_np_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}

variable "ol_pr_subs" {
  type        = list(string)
  description = "(optional) describe your variable"
}*/

variable "rbac" {
  type = list(object({
    scope                = string
    role_definition_name = optional(string)
    role_definition_id   = optional(string)
    principal_ids        = list(string)
  }))
  description = "(optional) describe your variable"
  default     = []
  validation {
    condition = alltrue(
      [
        for o in var.rbac : o.role_definition_id != o.role_definition_name ]
    )
    error_message = "Pass either role definition name or role definition id."
  }
}