output "vwan_id" {
  value = azurerm_virtual_wan.wan.id
}
output "vhub_id" {
  value = try(module.vhub[0].id, null)
}
/*output "vpn_gw_id" {
  value = try(module.vpn_gateway[0].vpn_gateway_id, null)
}
output "vpn_gw_name" {
  value = try(module.vpn_gateway[0].vpn_gateway_name, null)
}
output "vpn_sites" {
  value = try(module.vpn_sites[0].vpn_sites, null)
}*/
