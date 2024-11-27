locals {
  snets = flatten([
    for sub_count in range(length(var.subnets)) : [
      for count in range(0, var.vnet_count) : {
        vnet_name                                 = "${var.vnet_name}.${count}" // For var reference : VNet Key: Vnet name.count of Vnet; For default vnet, vnet_key is used
        subnet_name                               = "${var.subnets[sub_count].subnet_name}"
        virtual_network_name                      = azurerm_virtual_network.vnet[count].name
        subnet_cidr_list                          = [var.subnets[sub_count].subnet_cidr_list[count]]
        private_endpoint_network_policies_enabled = lookup(var.subnets[sub_count], "private_endpoint_network_policies_enabled", false)
        network_security_group_name               = "${var.subnets[sub_count].network_security_group_name}"
        network_security_group_rules              = lookup(var.subnets[sub_count], "network_security_group_rules", {})
        route_table_rg                            = lookup(var.subnets[sub_count], "route_table_rg", null)
        route_table_name                          = lookup(var.subnets[sub_count], "route_table_name", null)
      }
    ]
  ])
  snets_map = { for obj in local.snets : "${obj.vnet_name}.${obj.subnet_name}" => obj }
  #   vhub_connections = [
  #   for count in range(0, var.vnet_count) : {
  #     vnet_name = "${var.vnet_name}.${count}"
  #     vnet_id   = azurerm_virtual_network.vnet[count].id
  #   }
  # ]

  # vhub_connections_map = { for obj in local.vhub_connections : obj.vnet_name => obj.vnet_id }

}

output "snet" {
  value = local.snets
}

resource "azurerm_virtual_network" "vnet" {
  count               = var.vnet_count
  name                = "${var.vnet_name}-00${count.index + 1}"
  resource_group_name = var.resource_group_name
  address_space       = [var.vnet_cidr[count.index]]
  location            = var.location

  dns_servers = var.dns_servers

  tags = var.tags
}

module "snet" {
  source                                        = "./Subnet"
  for_each                                      = local.snets_map
  resource_group_name                           = var.resource_group_name
  subnet_name                                   = each.value.subnet_name
  virtual_network_name                          = each.value.virtual_network_name
  subnet_cidr_list                              = each.value.subnet_cidr_list
  private_endpoint_network_policies_enabled     = each.value.private_endpoint_network_policies_enabled
  private_link_service_network_policies_enabled = try(each.value.private_link_service_network_policies_enabled, null)
  network_security_group_name                   = each.value.network_security_group_name
  network_security_group_rules                  = each.value.network_security_group_rules
  route_table_name                              = try(each.value.route_table_name, null)
  route_table_rg                                = try(each.value.route_table_rg, null)
  location                                      = var.location
}


# module "vhub_connections" {
#   for_each = local.vhub_connections_map
#   source              = "../vWAN/vHub/vHubConnection"
#   remote_virtual_network_id = each.value.vnet_id
#   virtual_hub_id            = module.vhub[0].id
#   vhub_name = module.vhub[0].name
#   remote_virtual_network_name = each.value.vnet_name
  
# }