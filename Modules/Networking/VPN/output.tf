output "vpn_gw_id" {
  value       = module.vpn_gw.virtual_network_gateway_id
  description = "VPN gateway Id."
}
output "local_gw_ids" {
  value       = module.local_gw.local_network_gateway_ids
  description = "List of Local network gateway Ids."
}