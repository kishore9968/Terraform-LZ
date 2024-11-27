<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.23 |
| <a name="provider_azurerm.dest"></a> [azurerm.dest](#provider\_azurerm.dest) | ~>3.23 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_peering.peering_dest](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.peering_src](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dest_rg_name"></a> [dest\_rg\_name](#input\_dest\_rg\_name) | The name of the resource group where Dest Vnet exists. | `string` | n/a | yes |
| <a name="input_dest_vnet_id"></a> [dest\_vnet\_id](#input\_dest\_vnet\_id) | The name of the Dest Vnet. | `string` | n/a | yes |
| <a name="input_dest_vnet_name"></a> [dest\_vnet\_name](#input\_dest\_vnet\_name) | The name of the Dest Vnet. | `string` | n/a | yes |
| <a name="input_src_rg_name"></a> [src\_rg\_name](#input\_src\_rg\_name) | The name of the resource group where source Vnet exists. | `string` | n/a | yes |
| <a name="input_src_vnet_id"></a> [src\_vnet\_id](#input\_src\_vnet\_id) | The ID of the Source Vnet. | `string` | n/a | yes |
| <a name="input_src_vnet_name"></a> [src\_vnet\_name](#input\_src\_vnet\_name) | The name of the Source Vnet. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->