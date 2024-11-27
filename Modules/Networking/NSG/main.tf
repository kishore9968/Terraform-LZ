resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "nsg_rule" {
  for_each                     = var.nsg_rules
  name                         = each.value.name
  priority                     = each.value.priority
  direction                    = try(each.value.direction, "Inbound")
  access                       = try(each.value.access, "Allow")
  protocol                     = try(each.value.protocol, "*")
  description                  = try(each.value.description, null)
  source_port_range            = try(each.value.source_port_range, null)
  source_port_ranges           = try(each.value.source_port_ranges, null)
  destination_port_range       = try(each.value.destination_port_range, null)
  destination_port_ranges      = try(each.value.destination_port_ranges, null)
  source_address_prefix        = try(each.value.source_address_prefix, null)
  source_address_prefixes      = try(each.value.source_address_prefixes, null)
  destination_address_prefix   = try(each.value.destination_address_prefix, "*")
  destination_address_prefixes = try(each.value.destination_address_prefixes, null)
  resource_group_name          = var.resource_group_name
  network_security_group_name  = azurerm_network_security_group.nsg.name
}

