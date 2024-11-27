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
| [azurerm_virtual_network_gateway_connection.az_onprem](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_express_route_circuit_id"></a> [express\_route\_circuit\_id](#input\_express\_route\_circuit\_id) | The ID of the Express Route Circuit when creating an ExpressRoute connection | `any` | `null` | no |
| <a name="input_gateway_connection_protocol"></a> [gateway\_connection\_protocol](#input\_gateway\_connection\_protocol) | The IKE protocol version to use. Possible values are IKEv1 and IKEv2. Defaults to IKEv2 | `string` | `"IKEv2"` | no |
| <a name="input_gateway_connection_type"></a> [gateway\_connection\_type](#input\_gateway\_connection\_type) | The type of connection. Valid options are IPsec (Site-to-Site), ExpressRoute (ExpressRoute), and Vnet2Vnet (VNet-to-VNet) | `string` | `"IPsec"` | no |
| <a name="input_local_network_gateway_ids"></a> [local\_network\_gateway\_ids](#input\_local\_network\_gateway\_ids) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_local_network_gateway_names"></a> [local\_network\_gateway\_names](#input\_local\_network\_gateway\_names) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway | `list(object({ local_gateway_address = string, local_address_space = list(string), shared_key = string }))` | `[]` | no |
| <a name="input_local_networks_ipsec_policy"></a> [local\_networks\_ipsec\_policy](#input\_local\_networks\_ipsec\_policy) | IPSec policy for local networks. Only a single policy can be defined for a connection. | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_peer_virtual_network_gateway_id"></a> [peer\_virtual\_network\_gateway\_id](#input\_peer\_virtual\_network\_gateway\_id) | The ID of the peer virtual network gateway when creating a VNet-to-VNet connection | `any` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_virtual_network_gateway_id"></a> [virtual\_network\_gateway\_id](#input\_virtual\_network\_gateway\_id) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_virtual_network_gateway_name"></a> [virtual\_network\_gateway\_name](#input\_virtual\_network\_gateway\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_vpn_gw_sku"></a> [vpn\_gw\_sku](#input\_vpn\_gw\_sku) | Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments | `string` | `"VpnGw1"` | no |

## Outputs

No outputs.
