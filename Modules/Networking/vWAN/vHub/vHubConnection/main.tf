
locals {
  vhub_connection_name = "${var.vhub_name}_to_${var.remote_virtual_network_name}-cn"
}

/*data "azurerm_virtual_hub_route_table" "default" {
  name                = "defaultRouteTable"
  resource_group_name = var.remote_hub_rg_name
  virtual_hub_name    = var.vhub_name
}
data "azurerm_virtual_hub_route_table" "none" {
  name                = "noneRouteTable"
  resource_group_name = var.remote_hub_rg_name
  virtual_hub_name    = var.vhub_name
}
data "azurerm_virtual_hub_route_table" "online_fw" {
  name                = "az-ga-eus2-int-net-vhub-rt"
  resource_group_name = var.remote_hub_rg_name
  virtual_hub_name    = var.vhub_name
}*/

resource "azurerm_virtual_hub_connection" "peer_vnets_to_hub" {
  for_each = { for key, vnet in var.vnets : key => vnet if vnet.enable_vhub_connection }

  name                       = local.vhub_connection_name
  
  virtual_hub_id            = var.virtual_hub_id
  remote_virtual_network_id  = azurerm_virtual_network.vnet[each.key].id
  # name                      = local.vhub_connection_name
  # remote_virtual_network_id = var.remote_virtual_network_id
  # virtual_hub_id            = var.virtual_hub_id
  internet_security_enabled = var.internet_security_enabled

  /*routing {
    associated_route_table_id = var.ap_route_table_name == "Default" ? data.azurerm_virtual_hub_route_table.default.id : data.azurerm_virtual_hub_route_table.online_fw.id
    propagated_route_table {
      route_table_ids = [var.ap_route_table_name == "Default" ? data.azurerm_virtual_hub_route_table.default.id : data.azurerm_virtual_hub_route_table.none.id]
    }
    dynamic "static_vnet_route" {
      for_each = var.static_vnet_routes == null ? [] : var.static_vnet_routes
      content {
        name                = static_vnet_route.value["name"]
        address_prefixes    = static_vnet_route.value["address_prefixes"]
        next_hop_ip_address = static_vnet_route.value["next_hop_ip_address"]
      }
    }
  }*/
}
