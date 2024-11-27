## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.23 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_vpn_server_configuration.vpn_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_server_configuration) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_active_directory_authentication"></a> [azure\_active\_directory\_authentication](#input\_azure\_active\_directory\_authentication) | Azure Active Directory Authentication | <pre>object({<br>    audience = string<br>    issuer   = string<br>    tenant   = string<br>  })</pre> | `null` | no |
| <a name="input_client_revoked_certificate"></a> [client\_revoked\_certificate](#input\_client\_revoked\_certificate) | List of client revoked certificates. | <pre>list(object({<br>    name       = string<br>    thumbprint = string<br>  }))</pre> | `[]` | no |
| <a name="input_client_root_certificate"></a> [client\_root\_certificate](#input\_client\_root\_certificate) | List of client root certificates. | <pre>list(object({<br>    name             = string<br>    public_cert_data = string<br>  }))</pre> | `[]` | no |
| <a name="input_ipsec_policy"></a> [ipsec\_policy](#input\_ipsec\_policy) | A ipsec\_policy block | <pre>object({<br>    dh_group               = string<br>    ike_encryption         = string<br>    ike_integrity          = string<br>    ipsec_encryption       = string<br>    ipsec_integrity        = string<br>    pfs_group              = string<br>    sa_lifetime_seconds    = string<br>    sa_data_size_kilobytes = string<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_radius_configuration"></a> [radius\_configuration](#input\_radius\_configuration) | Radius configuration. | <pre>object({<br>    server = list(object({<br>      address = string<br>      secret  = string<br>      score   = number<br>    }))<br>    client_root_certificate = optional(list(object({<br>      name       = string<br>      thumbprint = string<br>    })))<br>    server_root_certificate = optional(list(object({<br>      name             = string<br>      public_cert_data = string<br>    })))<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the application's resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources. | `map(any)` | `{}` | no |
| <a name="input_vpn_authentication_types"></a> [vpn\_authentication\_types](#input\_vpn\_authentication\_types) | VPN Server authentiaction types. Allowed values are AAD, Certificate and Radius. | `list(string)` | <pre>[<br>  "Certificate"<br>]</pre> | no |
| <a name="input_vpn_protocols"></a> [vpn\_protocols](#input\_vpn\_protocols) | A list of VPN Protocols to use for this Server Configuration. Possible values are IkeV2 and OpenVPN | `list(string)` | `null` | no |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.23 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_vpn_server_configuration.vpn_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_server_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_active_directory_authentication"></a> [azure\_active\_directory\_authentication](#input\_azure\_active\_directory\_authentication) | Azure Active Directory Authentication | <pre>object({<br>    audience = string<br>    issuer   = string<br>    tenant   = string<br>  })</pre> | `null` | no |
| <a name="input_client_revoked_certificate"></a> [client\_revoked\_certificate](#input\_client\_revoked\_certificate) | List of client revoked certificates. | <pre>list(object({<br>    name       = string<br>    thumbprint = string<br>  }))</pre> | `[]` | no |
| <a name="input_client_root_certificate"></a> [client\_root\_certificate](#input\_client\_root\_certificate) | List of client root certificates. | <pre>list(object({<br>    name             = string<br>    public_cert_data = string<br>  }))</pre> | `[]` | no |
| <a name="input_ipsec_policy"></a> [ipsec\_policy](#input\_ipsec\_policy) | A ipsec\_policy block | <pre>object({<br>    dh_group               = string<br>    ike_encryption         = string<br>    ike_integrity          = string<br>    ipsec_encryption       = string<br>    ipsec_integrity        = string<br>    pfs_group              = string<br>    sa_lifetime_seconds    = string<br>    sa_data_size_kilobytes = string<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_radius_configuration"></a> [radius\_configuration](#input\_radius\_configuration) | Radius configuration. | <pre>object({<br>    server = list(object({<br>      address = string<br>      secret  = string<br>      score   = number<br>    }))<br>    client_root_certificate = optional(list(object({<br>      name       = string<br>      thumbprint = string<br>    })))<br>    server_root_certificate = optional(list(object({<br>      name             = string<br>      public_cert_data = string<br>    })))<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the application's resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources. | `map(any)` | `{}` | no |
| <a name="input_vpn_authentication_types"></a> [vpn\_authentication\_types](#input\_vpn\_authentication\_types) | VPN Server authentiaction types. Allowed values are AAD, Certificate and Radius. | `list(string)` | <pre>[<br>  "Certificate"<br>]</pre> | no |
| <a name="input_vpn_protocols"></a> [vpn\_protocols](#input\_vpn\_protocols) | A list of VPN Protocols to use for this Server Configuration. Possible values are IkeV2 and OpenVPN | `list(string)` | `null` | no |
| <a name="input_vpn_server_config_name"></a> [vpn\_server\_config\_name](#input\_vpn\_server\_config\_name) | Server configuration name. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->