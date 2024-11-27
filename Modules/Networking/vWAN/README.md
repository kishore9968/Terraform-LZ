# vWan with VPN

This module create vWan, vHub, Vpn sites and VPN gateway (Site to Site). 

## Sample Code

```

resource "azurerm_resource_group" "rg" {
  name     = "example-rg"
  location = "East US"
}

module "vWan" {
  source = "../../Modules/Networking/vWAN"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  vwan_name = "example-vWan"
  vhub = {
    address_prefix = "10.0.0.0/24"
    name           = "example-vhub"
    sku            = "Standard"
  }
  vpn_gateway = {
    name = "example-vpn-gw"
  }
  vpn_sites = [{
    name          = "example-site"
    address_cidrs = ["0.0.0.0/0"]
    device_vendor = "Cisco"
    links = [{
      ip_address    = "1.2.3.4"
      name          = "example"
      provider_name = "Verizon"
      speed_in_mbps = "500"
    }]
  }]
  vpn_connection_settings = [{
    link_config = [{
      ipsec_policy = {
        dh_group                 = "DHGroup14"
        encryption_algorithm     = "AES256"
        ike_encryption_algorithm = "AES256"
        ike_integrity_algorithm  = "SHA256"
        integrity_algorithm      = "SHA256"
        pfs_group                = "ECP256"
        sa_data_size_kb          = 102400000
        sa_lifetime_sec          = 28800
      }
      protocol = "IKEv2"
    }]
  }]
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
| <a name="module_vhub"></a> [vhub](#module\_vhub) | ./vHub | n/a |
| <a name="module_vpn_gateway"></a> [vpn\_gateway](#module\_vpn\_gateway) | ./Vpn/VpnGateway | n/a |
| <a name="module_vpn_gw_connections"></a> [vpn\_gw\_connections](#module\_vpn\_gw\_connections) | ./Vpn/vpnGwConnection | n/a |
| <a name="module_vpn_sites"></a> [vpn\_sites](#module\_vpn\_sites) | ./Vpn/VpnSites | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_wan.wan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_wan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_branch_to_branch_traffic"></a> [allow\_branch\_to\_branch\_traffic](#input\_allow\_branch\_to\_branch\_traffic) | Boolean flag to specify whether branch to branch traffic is allowed. | `bool` | `true` | no |
| <a name="input_disable_vpn_encryption"></a> [disable\_vpn\_encryption](#input\_disable\_vpn\_encryption) | Boolean flag to specify whether VPN encryption is disabled. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region to use | `string` | n/a | yes |
| <a name="input_office365_local_breakout_category"></a> [office365\_local\_breakout\_category](#input\_office365\_local\_breakout\_category) | Specifies the Office365 local breakout category. | `string` | `"None"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of key value pair to tag the resources. | `map(any)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | Specifies the Virtual WAN type | `string` | `"Standard"` | no |
| <a name="input_vhub"></a> [vhub](#input\_vhub) | An object to create vHub with the vWan. | <pre>object({<br>    name           = string<br>    address_prefix = string<br>    sku            = optional(string, "Standard")<br>    routes = optional(list(object({<br>      address_prefixes    = list(string),<br>      next_hop_ip_address = string<br>    })), [])<br>  })</pre> | `null` | no |
| <a name="input_vpn_connection_settings"></a> [vpn\_connection\_settings](#input\_vpn\_connection\_settings) | VPN Connections configuration for each link within VPN Site. | <pre>list(object({<br>    internet_security_enabled = optional(bool)<br>    link_config = list(object({<br>      egress_nat_rule_ids  = optional(list(string))<br>      ingress_nat_rule_ids = optional(list(string))<br>      bandwidth_mbps       = optional(number)<br>      bgp_enabled          = optional(bool)<br>      connection_mode      = optional(string)<br>      ipsec_policy = optional(object({<br>        dh_group                 = string<br>        ike_encryption_algorithm = string<br>        ike_integrity_algorithm  = string<br>        encryption_algorithm     = string<br>        integrity_algorithm      = string<br>        pfs_group                = string<br>        sa_data_size_kb          = number<br>        sa_lifetime_sec          = number<br>      }))<br>      protocol                              = optional(string)<br>      ratelimit_enabled                     = optional(bool)<br>      route_weight                          = optional(number)<br>      shared_key                            = optional(string)<br>      local_azure_ip_address_enabled        = optional(bool)<br>      policy_based_traffic_selector_enabled = optional(bool)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_vpn_gateway"></a> [vpn\_gateway](#input\_vpn\_gateway) | An object to create a Virtual Network Gateway within a vHub. | <pre>object({<br>    name                                  = string<br>    routing_preference                    = optional(string, "Microsoft Network")<br>    scale_unit                            = optional(number, 1)<br>    bgp_route_translation_for_nat_enabled = optional(bool, false)<br>    bgp_settings = optional(object({<br>      asn                            = optional(number, 65515)<br>      peer_weight                    = optional(number, 0)<br>      instance_0_bgp_peering_address = optional(list(string))<br>      instance_1_bgp_peering_address = optional(list(string))<br>      }), {<br>      asn         = 65515<br>      peer_weight = 0<br>    })<br><br>  })</pre> | `null` | no |
| <a name="input_vpn_sites"></a> [vpn\_sites](#input\_vpn\_sites) | A list of vpn site configurations. | <pre>list(object({<br>    name          = string<br>    address_cidrs = optional(list(string))<br>    links = list(object({<br>      name       = string<br>      fqdn       = optional(string)<br>      ip_address = optional(string)<br>      bgp = optional(list(object({<br>        asn             = string<br>        peering_address = string<br>      })))<br>      provider_name = optional(string)<br>      speed_in_mbps = optional(string)<br>    }))<br>    device_model  = optional(string)<br>    device_vendor = optional(string)<br>    o365_policy = optional(object({<br>      traffic_category = object({<br>        allow_endpoint_enabled    = bool<br>        default_endpoint_enabled  = bool<br>        optimize_endpoint_enabled = bool<br>      })<br>    }))<br>  }))</pre> | `null` | no |
| <a name="input_vwan_name"></a> [vwan\_name](#input\_vwan\_name) | Name of the virtual Wan. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vhub_id"></a> [vhub\_id](#output\_vhub\_id) | n/a |
| <a name="output_vpn_gw_id"></a> [vpn\_gw\_id](#output\_vpn\_gw\_id) | n/a |
| <a name="output_vpn_gw_name"></a> [vpn\_gw\_name](#output\_vpn\_gw\_name) | n/a |
| <a name="output_vpn_sites"></a> [vpn\_sites](#output\_vpn\_sites) | n/a |
| <a name="output_vwan_id"></a> [vwan\_id](#output\_vwan\_id) | n/a |
<!-- END_TF_DOCS -->