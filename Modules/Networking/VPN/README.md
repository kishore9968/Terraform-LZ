## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ./local-gateway | n/a |
| <a name="module_vpn_connection"></a> [vpn\_connection](#module\_vpn\_connection) | ./vpn-connection | n/a |
| <a name="module_vpn_gw"></a> [vpn\_gw](#module\_vpn\_gw) | ./vpn-gateway | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bgbgp_peering_addresses"></a> [bgbgp\_peering\_addresses](#input\_bgbgp\_peering\_addresses) | The BGP peer IP address of the virtual network gateway. This address is needed to configure the created gateway as a BGP Peer on the on-premises VPN devices. The IP address must be part of the subnet of the Virtual Network Gateway. | `list(object({ ip_configuration_name = string, apipa_addresses = list(string) }))` | `[]` | no |
| <a name="input_bgp_asn_number"></a> [bgp\_asn\_number](#input\_bgp\_asn\_number) | The Autonomous System Number (ASN) to use as part of the BGP | `number` | `"65515"` | no |
| <a name="input_bgp_peer_weight"></a> [bgp\_peer\_weight](#input\_bgp\_peer\_weight) | The weight added to routes which have been learned through BGP peering. Valid values can be between 0 and 100 | `string` | `""` | no |
| <a name="input_enable_active_active"></a> [enable\_active\_active](#input\_enable\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false | `bool` | `false` | no |
| <a name="input_express_route_circuit_id"></a> [express\_route\_circuit\_id](#input\_express\_route\_circuit\_id) | The ID of the Express Route Circuit when creating an ExpressRoute connection | `any` | `null` | no |
| <a name="input_expressroute_sku"></a> [expressroute\_sku](#input\_expressroute\_sku) | Configuration of the size and capacity of the virtual network gateway for ExpressRoute type. Valid options are Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ and depend on the type, vpn\_type and generation arguments | `string` | `"Standard"` | no |
| <a name="input_gateway_connection_protocol"></a> [gateway\_connection\_protocol](#input\_gateway\_connection\_protocol) | The IKE protocol version to use. Possible values are IKEv1 and IKEv2. Defaults to IKEv2 | `string` | `"IKEv2"` | no |
| <a name="input_gateway_connection_type"></a> [gateway\_connection\_type](#input\_gateway\_connection\_type) | The type of connection. Valid options are IPsec (Site-to-Site), ExpressRoute (ExpressRoute), and Vnet2Vnet (VNet-to-VNet) | `string` | `"IPsec"` | no |
| <a name="input_gateway_type"></a> [gateway\_type](#input\_gateway\_type) | The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute | `string` | `"Vpn"` | no |
| <a name="input_gw_subnet_id"></a> [gw\_subnet\_id](#input\_gw\_subnet\_id) | GatewaySubnet Id | `string` | n/a | yes |
| <a name="input_local_bgp_settings"></a> [local\_bgp\_settings](#input\_local\_bgp\_settings) | Local Network Gateway's BGP speaker settings | `list(object({ asn_number = number, peering_address = string, peer_weight = number }))` | `null` | no |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway | `list(object({ local_gateway_address = string, local_address_space = list(string), shared_key = string }))` | `[]` | no |
| <a name="input_local_networks_ipsec_policy"></a> [local\_networks\_ipsec\_policy](#input\_local\_networks\_ipsec\_policy) | IPSec policy for local networks. Only a single policy can be defined for a connection. | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the resources. | `string` | n/a | yes |
| <a name="input_peer_virtual_network_gateway_id"></a> [peer\_virtual\_network\_gateway\_id](#input\_peer\_virtual\_network\_gateway\_id) | The ID of the peer virtual network gateway when creating a VNet-to-VNet connection | `any` | `null` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic | `string` | `"Basic"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpn_client_configuration"></a> [vpn\_client\_configuration](#input\_vpn\_client\_configuration) | Virtual Network Gateway client configuration to accept IPSec point-to-site connections | `object({ address_space = string, certificate = string, vpn_client_protocols = list(string) })` | `null` | no |
| <a name="input_vpn_gw_generation"></a> [vpn\_gw\_generation](#input\_vpn\_gw\_generation) | The Generation of the Virtual Network gateway. Possible values include Generation1, Generation2 or None | `string` | `"Generation1"` | no |
| <a name="input_vpn_gw_sku"></a> [vpn\_gw\_sku](#input\_vpn\_gw\_sku) | Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments | `string` | `"VpnGw1"` | no |
| <a name="input_vpn_type"></a> [vpn\_type](#input\_vpn\_type) | The routing type of the Virtual Network Gateway. Valid options are RouteBased or PolicyBased. Defaults to RouteBased | `string` | `"RouteBased"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_local_gw_ids"></a> [local\_gw\_ids](#output\_local\_gw\_ids) | List of Local network gateway Ids. |
| <a name="output_vpn_gw_id"></a> [vpn\_gw\_id](#output\_vpn\_gw\_id) | VPN gateway Id. |
