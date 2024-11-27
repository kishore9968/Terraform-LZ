<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_express_route_circuit.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_circuit) | resource |
| [azurerm_express_route_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bandwidth_in_mbps"></a> [bandwidth\_in\_mbps](#input\_bandwidth\_in\_mbps) | (optional) describe your variable | `number` | n/a | yes |
| <a name="input_er_circuit_name"></a> [er\_circuit\_name](#input\_er\_circuit\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_er_gateway_name"></a> [er\_gateway\_name](#input\_er\_gateway\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_er_gateway_scale_units"></a> [er\_gateway\_scale\_units](#input\_er\_gateway\_scale\_units) | (optional) describe your variable | `number` | `1` | no |
| <a name="input_location"></a> [location](#input\_location) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_peering_location"></a> [peering\_location](#input\_peering\_location) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_service_provider_name"></a> [service\_provider\_name](#input\_service\_provider\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_sku_family"></a> [sku\_family](#input\_sku\_family) | (optional) describe your variable | `string` | `"MeteredData"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | (optional) describe your variable | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (optional) describe your variable | `map(string)` | `{}` | no |
| <a name="input_virtual_hub_id"></a> [virtual\_hub\_id](#input\_virtual\_hub\_id) | (optional) describe your variable | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_er_circuit_id"></a> [er\_circuit\_id](#output\_er\_circuit\_id) | n/a |
| <a name="output_er_gateway_id"></a> [er\_gateway\_id](#output\_er\_gateway\_id) | n/a |
<!-- END_TF_DOCS -->