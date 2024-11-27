output "vpn_site_ids" {
  value = azurerm_vpn_site.vpn_site[*].id
}


output "vpn_sites" {
  value = [
    for vpn_site in azurerm_vpn_site.vpn_site : {
      id    = vpn_site.id
      name  = vpn_site.name
      links = vpn_site.link
  }]
}