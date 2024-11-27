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
| [azurerm_vpn_gateway.vpn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_gateway) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the application's resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources. | `map(string)` | `{}` | no |
| <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id) | ID of the Virtual Hub in which to deploy the VPN | `string` | n/a | yes |
| <a name="input_vpn_gateway_bgp_asn"></a> [vpn\_gateway\_bgp\_asn](#input\_vpn\_gateway\_bgp\_asn) | The asn for BGP setting. | `number` | `65515` | no |
| <a name="input_vpn_gateway_bgp_peer_weight"></a> [vpn\_gateway\_bgp\_peer\_weight](#input\_vpn\_gateway\_bgp\_peer\_weight) | The weight added to Routes learned from this BGP Speaker. | `number` | `0` | no |
| <a name="input_vpn_gateway_bgp_route_translation_for_nat_enabled"></a> [vpn\_gateway\_bgp\_route\_translation\_for\_nat\_enabled](#input\_vpn\_gateway\_bgp\_route\_translation\_for\_nat\_enabled) | bgp route translation for nat enabled | `bool` | `false` | no |
| <a name="input_vpn_gateway_instance_0_bgp_peering_address"></a> [vpn\_gateway\_instance\_0\_bgp\_peering\_address](#input\_vpn\_gateway\_instance\_0\_bgp\_peering\_address) | List of custom BGP IP Addresses to assign to the first instance | `list(string)` | `null` | no |
| <a name="input_vpn_gateway_instance_1_bgp_peering_address"></a> [vpn\_gateway\_instance\_1\_bgp\_peering\_address](#input\_vpn\_gateway\_instance\_1\_bgp\_peering\_address) | List of custom BGP IP Addresses to assign to the second instance | `list(string)` | `null` | no |
| <a name="input_vpn_gateway_routing_preference"></a> [vpn\_gateway\_routing\_preference](#input\_vpn\_gateway\_routing\_preference) | Azure routing preference. Tou can choose to route traffic either via `Microsoft network` or via the ISP network through public `Internet` | `string` | `"Microsoft Network"` | no |
| <a name="input_vpn_gateway_scale_unit"></a> [vpn\_gateway\_scale\_unit](#input\_vpn\_gateway\_scale\_unit) | The scale unit for this VPN Gateway | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_gateway_id"></a> [vpn\_gateway\_id](#output\_vpn\_gateway\_id) | n/a |
| <a name="output_vpn_gateway_name"></a> [vpn\_gateway\_name](#output\_vpn\_gateway\_name) | n/a |

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
| [azurerm_vpn_gateway.vpn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/vpn_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the application's resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the resources. | `map(string)` | `{}` | no |
| <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id) | ID of the Virtual Hub in which to deploy the VPN | `string` | n/a | yes |
| <a name="input_vpn_gateway_bgp_asn"></a> [vpn\_gateway\_bgp\_asn](#input\_vpn\_gateway\_bgp\_asn) | The asn for BGP setting. | `number` | `65515` | no |
| <a name="input_vpn_gateway_bgp_peer_weight"></a> [vpn\_gateway\_bgp\_peer\_weight](#input\_vpn\_gateway\_bgp\_peer\_weight) | The weight added to Routes learned from this BGP Speaker. | `number` | `0` | no |
| <a name="input_vpn_gateway_bgp_route_translation_for_nat_enabled"></a> [vpn\_gateway\_bgp\_route\_translation\_for\_nat\_enabled](#input\_vpn\_gateway\_bgp\_route\_translation\_for\_nat\_enabled) | bgp route translation for nat enabled | `bool` | `false` | no |
| <a name="input_vpn_gateway_instance_0_bgp_peering_address"></a> [vpn\_gateway\_instance\_0\_bgp\_peering\_address](#input\_vpn\_gateway\_instance\_0\_bgp\_peering\_address) | List of custom BGP IP Addresses to assign to the first instance | `list(string)` | `null` | no |
| <a name="input_vpn_gateway_instance_1_bgp_peering_address"></a> [vpn\_gateway\_instance\_1\_bgp\_peering\_address](#input\_vpn\_gateway\_instance\_1\_bgp\_peering\_address) | List of custom BGP IP Addresses to assign to the second instance | `list(string)` | `null` | no |
| <a name="input_vpn_gateway_routing_preference"></a> [vpn\_gateway\_routing\_preference](#input\_vpn\_gateway\_routing\_preference) | Azure routing preference. Tou can choose to route traffic either via `Microsoft network` or via the ISP network through public `Internet` | `string` | `"Microsoft Network"` | no |
| <a name="input_vpn_gateway_scale_unit"></a> [vpn\_gateway\_scale\_unit](#input\_vpn\_gateway\_scale\_unit) | The scale unit for this VPN Gateway | `number` | `1` | no |
| <a name="input_vpn_gw_name"></a> [vpn\_gw\_name](#input\_vpn\_gw\_name) | The name of the VPN Gateway. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_gateway_id"></a> [vpn\_gateway\_id](#output\_vpn\_gateway\_id) | n/a |
| <a name="output_vpn_gateway_name"></a> [vpn\_gateway\_name](#output\_vpn\_gateway\_name) | n/a |
<!-- END_TF_DOCS -->