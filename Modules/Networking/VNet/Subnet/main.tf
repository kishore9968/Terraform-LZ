data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {
  subscription_id = data.azurerm_client_config.current.subscription_id
}
locals {
  route_table_rg            = coalesce(var.route_table_rg, var.resource_group_name)
  network_security_group_id = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/networkSecurityGroups/%s", data.azurerm_subscription.current.subscription_id, var.resource_group_name, coalesce(var.network_security_group_name, "null"))
  route_table_id            = format("/subscriptions/%s/resourceGroups/%s/providers/Microsoft.Network/routeTables/%s", data.azurerm_subscription.current.subscription_id, local.route_table_rg, coalesce(var.route_table_name, "null"))
  nsg_name                  = var.subnet_name == "AzureBastionSubnet" ? "bas-prd-cus-001" : join("-", [var.subnet_name])
}


resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_cidr_list

  service_endpoints = var.service_endpoints
  dynamic "delegation" {
    for_each = { for delegation in try(var.subnet_delegation, []) : delegation.name => delegation.service_delegation }
    content {
      name = delegation.key
      service_delegation {
        name    = delegation.value.name
        actions = try(delegation.value.actions, null)
      }
    }
  }
  # dynamic "delegation" {
  #   for_each = var.subnet_delegation
  #   content {
  #     name = delegation.key
  #     dynamic "service_delegation" {
  #       for_each = toset(delegation.value)
  #       content {
  #         name    = service_delegation.value.name
  #         actions = service_delegation.value.actions
  #       }
  #     }
  #   }
  # }

  #private_endpoint_network_policies_enabled     = var.private_endpoint_network_policies_enabled
  #private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
}

module "nsg" {
  count               = var.network_security_group_name == "" ? 1 : 0
  source              = "../../NSG"
  nsg_name            = "${local.nsg_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  nsg_rules           = var.network_security_group_rules
  depends_on          = [azurerm_subnet.subnet]
}

resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  count = var.network_security_group_name == "" || azurerm_subnet.subnet.name != "GatewaySubnet" ? 1 : 0
  
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = var.network_security_group_name == "" ? module.nsg[0].id : local.network_security_group_id
  depends_on = [
    module.nsg
  ]
}

resource "azurerm_subnet_route_table_association" "route_table_association" {
  count = var.route_table_name == null ? 0 : 1

  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = local.route_table_id

}

/*resource "azurerm_subnet_network_security_group_association" "subnet_association" {
  # count = var.network_security_group_name == null ? 0 : 1

  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = module.nsg[0].network_security_group_id
  depends_on = [
    module.nsg
  ]
}

resource "azurerm_subnet_route_table_association" "route_table_association" {
  count = var.route_table_name == null ? 0 : 1

  subnet_id      = azurerm_subnet.subnet.id
  route_table_id = local.route_table_id

}*/