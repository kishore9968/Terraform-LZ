
resource "azurerm_role_assignment" "role_assignment" {
  for_each             = toset(var.principal_ids)
  scope                = var.scope
  role_definition_name = var.role_definition_name
  role_definition_id   = var.role_definition_id
  principal_id         = each.value
}