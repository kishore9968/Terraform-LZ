resource "azurerm_virtual_hub" "vhub" {
  name                = var.vhub_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_wan_id      = var.virtual_wan_id
  address_prefix      = var.virtual_hub_address_prefix

  sku = var.virtual_hub_sku
  dynamic "route" {
    for_each = toset(var.virtual_hub_routes)
    content {
      address_prefixes    = route.value.address_prefixes
      next_hop_ip_address = route.value.next_hop_ip_address
    }
  }
  tags = var.tags
}
