# Network Security Group 


## Sample code

```
    module "nsg" {
        source = "../../Modules/Networking/NSG"      
        nsg_name            = "nsg-sample"
        location            = "eastus"
        resource_group_name = data.azurerm_resource_group.rg.name
        tags                = local.tags
        nsg_rules           = {
            "Allow-3389-from-bastion" = {
                name                   = "Allow-3389-from-bastion"
                access                 = "Allow"
                description            = "Allow Port(s) 3389 Inbound"
                priority               = 200
                direction              = "Inbound"
                source_port_range      = "*"
                destination_port_range = 3389
                source_address_prefix  = "0.0.0.0/0"
            }
            "Allow-22-from-bastion" = {
                name                   = "Allow-22-from-bastion"
                access                 = "Allow"
                description            = "Allow Port(s) 22 Inbound"
                priority               = 210
                direction              = "Inbound"
                source_port_range      = "*"
                destination_port_range = 22
                source_address_prefix  = "0.0.0.0/0"
            }
        }
    }
```


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
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.nsg_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_nsg_rules"></a> [nsg\_rules](#input\_nsg\_rules) | Additional network security group rules to add. For arguements please refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule#argument-reference | `map` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_network_security_group_name"></a> [network\_security\_group\_name](#output\_network\_security\_group\_name) | n/a |
<!-- END_TF_DOCS -->