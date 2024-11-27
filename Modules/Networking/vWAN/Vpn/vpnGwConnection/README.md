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
| [azurerm_vpn_gateway_connection.vpn_gateway_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_gateway_connection) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the application's resource group. | `string` | n/a | yes |
| <a name="input_vpn_connections"></a> [vpn\_connections](#input\_vpn\_connections) | VPN Connections configuration for each links. | <pre>list(object({<br>    internet_security_enabled = optional(bool)<br>    link_config = list(object({<br>      egress_nat_rule_ids  = optional(list(string))<br>      ingress_nat_rule_ids = optional(list(string))<br>      bandwidth_mbps       = optional(number)<br>      bgp_enabled          = optional(bool)<br>      connection_mode      = optional(string)<br>      ipsec_policy = optional(object({<br>        dh_group                 = string<br>        ike_encryption_algorithm = string<br>        ike_integrity_algorithm  = string<br>        encryption_algorithm     = string<br>        integrity_algorithm      = string<br>        pfs_group                = string<br>        sa_data_size_kb          = number<br>        sa_lifetime_sec          = number<br>      }))<br>      protocol                              = optional(string)<br>      ratelimit_enabled                     = optional(bool)<br>      route_weight                          = optional(number)<br>      shared_key                            = optional(string)<br>      local_azure_ip_address_enabled        = optional(bool)<br>      policy_based_traffic_selector_enabled = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_vpn_gateway_id"></a> [vpn\_gateway\_id](#input\_vpn\_gateway\_id) | ID of VPN gateway. | `string` | n/a | yes |
| <a name="input_vpn_gateway_name"></a> [vpn\_gateway\_name](#input\_vpn\_gateway\_name) | Name of VPN gateway. | `string` | n/a | yes |
| <a name="input_vpn_sites"></a> [vpn\_sites](#input\_vpn\_sites) | List Ids of vpn sites and corresponding id of vpn links. | `list(any)` | n/a | yes |

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
| [azurerm_vpn_gateway_connection.vpn_gateway_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpn_connection_settings"></a> [vpn\_connection\_settings](#input\_vpn\_connection\_settings) | VPN Connections configuration for each links. | <pre>list(object({<br>    internet_security_enabled = optional(bool)<br>    link_config = list(object({<br>      egress_nat_rule_ids  = optional(list(string))<br>      ingress_nat_rule_ids = optional(list(string))<br>      bandwidth_mbps       = optional(number)<br>      bgp_enabled          = optional(bool)<br>      connection_mode      = optional(string)<br>      ipsec_policy = optional(object({<br>        dh_group                 = string<br>        ike_encryption_algorithm = string<br>        ike_integrity_algorithm  = string<br>        encryption_algorithm     = string<br>        integrity_algorithm      = string<br>        pfs_group                = string<br>        sa_data_size_kb          = number<br>        sa_lifetime_sec          = number<br>      }))<br>      protocol                              = optional(string)<br>      ratelimit_enabled                     = optional(bool)<br>      route_weight                          = optional(number)<br>      shared_key                            = optional(string)<br>      local_azure_ip_address_enabled        = optional(bool)<br>      policy_based_traffic_selector_enabled = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_vpn_gateway_id"></a> [vpn\_gateway\_id](#input\_vpn\_gateway\_id) | ID of VPN gateway. | `string` | n/a | yes |
| <a name="input_vpn_gateway_name"></a> [vpn\_gateway\_name](#input\_vpn\_gateway\_name) | Name of VPN gateway. | `string` | n/a | yes |
| <a name="input_vpn_sites"></a> [vpn\_sites](#input\_vpn\_sites) | List Ids of vpn sites and corresponding id of vpn links. | `list(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->