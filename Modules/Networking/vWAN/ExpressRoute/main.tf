resource "azurerm_express_route_circuit" "er_circuit" {
  name                  = var.er_circuit_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  service_provider_name = var.service_provider_name
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth_in_mbps

  sku {
    tier   = var.sku_tier
    family = var.sku_family
  }

  tags = var.tags
}

resource "azurerm_express_route_gateway" "er_gateway" {
  name                = var.er_gateway_name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_hub_id      = var.virtual_hub_id
  scale_units         = var.er_gateway_scale_units

  tags = var.tags
}

output "er_gateway_id" {
  value = azurerm_express_route_gateway.er_gateway.id
}
output "er_circuit_id" {
  value = azurerm_express_route_circuit.er_circuit.id
}