data "azurerm_client_config" "current" {}
data "azurerm_subscription" "current" {
  subscription_id = data.azurerm_client_config.current.subscription_id
}

locals {
  rg_name_list   = split("-", var.resource_group_name)
  subp_name_list = split("-", data.azurerm_subscription.current.display_name) // Once subpns are setup use data.azurerm_subscription.current.subscription_name

  location_prefix = local.rg_name_list[length(local.rg_name_list) - 2] // Second affix from last is location in resource group name

  is_tt           = local.subp_name_list[0] == "tt" ? true : false
  resource_prefix = local.is_tt == true ? "tt-" : ""

  env = local.subp_name_list[length(local.subp_name_list) - 1]

  resource_postfix = replace("${local.env}-${local.location_prefix}", "/\\s+/", "")
}

resource "azurerm_public_ip" "pip_gw" {
  name                = "${local.resource_prefix}pip-gw-${local.resource_postfix}-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  tags                = var.tags
}
resource "azurerm_public_ip" "pip_aa" {
  count               = var.enable_active_active == true ? 1 : 0
  name                = "${local.resource_prefix}pip-gw-aa-${local.resource_postfix}-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  tags                = var.tags
}

resource "azurerm_virtual_network_gateway" "vpngw" {
  name                = "${local.resource_prefix}vpngw-${local.resource_postfix}-001"
  location            = var.location
  resource_group_name = var.resource_group_name
  vpn_type            = var.gateway_type != "ExpressRoute" ? var.vpn_type : null
  sku                 = var.gateway_type != "ExpressRoute" ? var.vpn_gw_sku : var.expressroute_sku
  active_active       = var.vpn_gw_sku != "Basic" ? var.enable_active_active : false
  enable_bgp          = var.vpn_gw_sku != "Basic" ? var.enable_bgp : false
  generation          = var.vpn_gw_generation
  type                = var.gateway_type

  dynamic "bgp_settings" {
    for_each = var.enable_bgp ? [true] : []
    content {
      asn = var.bgp_asn_number
      dynamic "peering_addresses" {
        for_each = var.bgp_peering_addresses
        content {
          ip_configuration_name = lookup(var.bgp_peering_addresses, "ip_configuration_name", null)
          apipa_addresses       = lookup(var.bgp_peering_addresses, "apipa_addresses", null)
        }
      }
      peer_weight = var.bgp_peer_weight
    }
  }

  ip_configuration {
    name                          = "${local.resource_prefix}vnetGatewayConfig-${local.resource_postfix}-001"
    public_ip_address_id          = azurerm_public_ip.pip_gw.id
    private_ip_address_allocation = var.private_ip_address_allocation
    subnet_id                     = var.gw_subnet_id
  }

  dynamic "ip_configuration" {
    for_each = var.enable_active_active ? [true] : []
    content {
      name                          = "${local.resource_prefix}vnetGatewayConfigAA-${local.resource_postfix}-001"
      public_ip_address_id          = azurerm_public_ip.pip_aa.id
      private_ip_address_allocation = var.private_ip_address_allocation
      subnet_id                     = var.gw_subnet_id
    }
  }
  dynamic "vpn_client_configuration" {
    for_each = var.vpn_client_configuration != null ? [var.vpn_client_configuration] : []
    iterator = vpn
    content {
      address_space = [vpn.value.address_space]
      root_certificate {
        name             = "point-to-site-root-certifciate"
        public_cert_data = vpn.value.certificate
      }
      vpn_client_protocols = vpn.value.vpn_client_protocols
    }
  }
  tags = var.tags
}

output "virtual_network_gateway_id" {
  value = azurerm_virtual_network_gateway.vpngw.id
}
output "virtual_network_gateway_name" {
  value = azurerm_virtual_network_gateway.vpngw.name
}
