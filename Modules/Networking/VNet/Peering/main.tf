resource "azurerm_virtual_network_peering" "peering_src" {
  name                      = "peer-${var.src_vnet_name}-to-${var.dest_vnet_name}"
  resource_group_name       = var.src_rg_name
  virtual_network_name      = var.src_vnet_name
  remote_virtual_network_id = var.dest_vnet_id
}

resource "azurerm_virtual_network_peering" "peering_dest" {
  name                      = "peer-${var.dest_vnet_name}-to-${var.src_vnet_name}"
  resource_group_name       = var.dest_rg_name
  virtual_network_name      = var.dest_vnet_name
  remote_virtual_network_id = var.src_vnet_id
  provider                  = azurerm.destination
}
