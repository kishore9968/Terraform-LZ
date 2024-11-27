# Vnet
This module creates a vnet along with the specified subnets and nsgs.

## Sample Code

- If you don't have existing NSG.
  ```
  module "vnet" {
    source = "../../Modules/Networking/VNet"

    location            = "East US"
    resource_group_name = "example-rg"

    vnet_name   = "vnet-example"
    vnet_cidr   = ["28.0.24.0/23"]
    dns_servers = ["28.0.25.11", "28.0.25.12"]
    subnets = {
      "adds_subnet" = {
        subnet_name                 = "snet-dc"
        subnet_cidr_list            = ["28.0.24.0/27"]
        # Pass nsg rules
        network_security_group_rules = {
          Allow-HTTPS-from-VirtualNetwork = {
            name                   = "Allow-HTTPS-from-VirtualNetwork"
            access                 = "Allow"
            description            = "Allow Port(s) 443 Inbound from VirtualNetwork to *"
            priority               = 201
            direction              = "Inbound"
            source_port_range      = "*"
            destination_port_range = 443
            source_address_prefix  = "VirtualNetwork"
          }
        }
      }
    }
    tags = {}
  }
  ```
- If you have existing NSG

  ```
  module "vnet" {
    source = "../../Modules/Networking/VNet"

    location            = "East US"
    resource_group_name = "example-rg"

    vnet_name   = "vnet-example"
    vnet_cidr   = ["28.0.24.0/23"]
    dns_servers = ["28.0.25.11", "28.0.25.12"]
    subnets = {
      "adds_subnet" = {
        subnet_name                 = "snet-dc"
        subnet_cidr_list            = ["28.0.24.0/27"]
        # Pass nsg name
        network_security_group_name = "default-nsg"
      }
    }
    tags = {}
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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_snet"></a> [snet](#module\_snet) | ./Subnet | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of IP addresses of DNS servers | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the virtual network is created | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnet object with required parameters. If you have existing nsg created, pass the name of nsg. Otherwise pass the nsg rules it will create a nsg and associate it to the subnet. | <pre>list(object({<br>    subnet_name                  = string<br>    subnet_cidr_list             = list(string)<br>    network_security_group_name  = optional(string)<br>    network_security_group_rules = optional(any)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_vnet_cidr"></a> [vnet\_cidr](#input\_vnet\_cidr) | The address space that is used by the virtual network | `list(string)` | n/a | yes |
| <a name="input_vnet_count"></a> [vnet\_count](#input\_vnet\_count) | VNet count | `number` | `1` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_snet"></a> [snet](#output\_snet) | n/a |
| <a name="output_snet_nsgs"></a> [snet\_nsgs](#output\_snet\_nsgs) | n/a |
| <a name="output_snets"></a> [snets](#output\_snets) | n/a |
| <a name="output_vnets"></a> [vnets](#output\_vnets) | output "vnet\_name" { value = azurerm\_virtual\_network.vnet.name } |
<!-- END_TF_DOCS -->