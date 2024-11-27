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
| [azurerm_virtual_hub.vhub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internet_security_enabled"></a> [internet\_security\_enabled](#input\_internet\_security\_enabled) | Define internet security parameter in Virtual Hub Connections if set | `bool` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region to use | `string` | n/a | yes |
| <a name="input_peered_virtual_networks"></a> [peered\_virtual\_networks](#input\_peered\_virtual\_networks) | List of Virtual Networks IDs to peer with the Virtual Hub. | `list(string)` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_vhub_name"></a> [vhub\_name](#input\_vhub\_name) | Virutal Hub Name. | `string` | n/a | yes |
| <a name="input_virtual_hub_address_prefix"></a> [virtual\_hub\_address\_prefix](#input\_virtual\_hub\_address\_prefix) | The Address Prefix which should be used for this Virtual Hub. | `string` | n/a | yes |
| <a name="input_virtual_hub_routes"></a> [virtual\_hub\_routes](#input\_virtual\_hub\_routes) | List of route blocks. `next_hop_ip_address` values can be `azure_firewall` or an IP address. | <pre>list(object({<br>    address_prefixes    = list(string),<br>    next_hop_ip_address = string<br>  }))</pre> | `[]` | no |
| <a name="input_virtual_hub_sku"></a> [virtual\_hub\_sku](#input\_virtual\_hub\_sku) | The SKU of the Virtual Hub. Possible values are `Basic` and `Standard` | `string` | `"Standard"` | no |
| <a name="input_virtual_wan_id"></a> [virtual\_wan\_id](#input\_virtual\_wan\_id) | The ID of a Virtual WAN within which the Virtual Hub should be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->