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
| [azurerm_vpn_site.vpn_site](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_site) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the application's resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources. | `map(string)` | `{}` | no |
| <a name="input_virtual_wan_id"></a> [virtual\_wan\_id](#input\_virtual\_wan\_id) | ID of the Virtual Wan who hosts the Virtual Hub | `string` | n/a | yes |
| <a name="input_vpn_sites"></a> [vpn\_sites](#input\_vpn\_sites) | VPN Site configuration | <pre>list(object({<br>    address_cidrs = optional(list(string))<br>    links = list(object({<br>      name       = string<br>      fqdn       = optional(string)<br>      ip_address = optional(string)<br>      bgp = optional(list(object({<br>        asn             = string<br>        peering_address = string<br>      })))<br>      provider_name = optional(string)<br>      speed_in_mbps = optional(string)<br>    }))<br>    device_model  = optional(string)<br>    device_vendor = optional(string)<br>    o365_policy = optional(object({<br>      traffic_category = object({<br>        allow_endpoint_enabled    = bool<br>        default_endpoint_enabled  = bool<br>        optimize_endpoint_enabled = bool<br>      })<br>    }))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_site_ids"></a> [vpn\_site\_ids](#output\_vpn\_site\_ids) | n/a |
| <a name="output_vpn_sites"></a> [vpn\_sites](#output\_vpn\_sites) | n/a |

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
| [azurerm_vpn_site.vpn_site](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_site) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the application's resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources. | `map(string)` | `{}` | no |
| <a name="input_virtual_wan_id"></a> [virtual\_wan\_id](#input\_virtual\_wan\_id) | ID of the Virtual Wan who hosts the Virtual Hub | `string` | n/a | yes |
| <a name="input_vpn_sites"></a> [vpn\_sites](#input\_vpn\_sites) | A list of vpn site configurations. | <pre>list(object({<br>    name          = string<br>    address_cidrs = optional(list(string))<br>    links = list(object({<br>      name       = string<br>      fqdn       = optional(string)<br>      ip_address = optional(string)<br>      bgp = optional(list(object({<br>        asn             = string<br>        peering_address = string<br>      })))<br>      provider_name = optional(string)<br>      speed_in_mbps = optional(string)<br>    }))<br>    device_model  = optional(string)<br>    device_vendor = optional(string)<br>    o365_policy = optional(object({<br>      traffic_category = object({<br>        allow_endpoint_enabled    = bool<br>        default_endpoint_enabled  = bool<br>        optimize_endpoint_enabled = bool<br>      })<br>    }))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_site_ids"></a> [vpn\_site\_ids](#output\_vpn\_site\_ids) | n/a |
| <a name="output_vpn_sites"></a> [vpn\_sites](#output\_vpn\_sites) | n/a |
<!-- END_TF_DOCS -->