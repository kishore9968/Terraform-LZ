variable "resource_group_name" {
  description = "Name of the application's resource group."
  type        = string
}

variable "location" {
  description = "Azure location."
  type        = string
}

variable "vpn_server_config_name" {
  type        = string
  description = "Server configuration name."
}

variable "vpn_authentication_types" {
  type        = list(string)
  description = "VPN Server authentiaction types. Allowed values are AAD, Certificate and Radius."
  default     = ["Certificate"]
}

variable "client_root_certificate" {
  type = list(object({
    name             = string
    public_cert_data = string
  }))
  description = "List of client root certificates."
  default     = []
}

variable "client_revoked_certificate" {
  type = list(object({
    name       = string
    thumbprint = string
  }))
  description = "List of client revoked certificates."
  default     = []
}
variable "azure_active_directory_authentication" {
  type = object({
    audience = string
    issuer   = string
    tenant   = string
  })
  description = "Azure Active Directory Authentication"
  default     = null
}

variable "radius_configuration" {
  type = object({
    server = list(object({
      address = string
      secret  = string
      score   = number
    }))
    client_root_certificate = optional(list(object({
      name       = string
      thumbprint = string
    })))
    server_root_certificate = optional(list(object({
      name             = string
      public_cert_data = string
    })))
  })
  description = "Radius configuration."
  default     = null
}

variable "ipsec_policy" {
  type = object({
    dh_group               = string
    ike_encryption         = string
    ike_integrity          = string
    ipsec_encryption       = string
    ipsec_integrity        = string
    pfs_group              = string
    sa_lifetime_seconds    = string
    sa_data_size_kilobytes = string
  })
  description = "A ipsec_policy block "
  default     = null
}

variable "vpn_protocols" {
  type        = list(string)
  description = " A list of VPN Protocols to use for this Server Configuration. Possible values are IkeV2 and OpenVPN"
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "Tags for the resources."
  default     = {}
}
