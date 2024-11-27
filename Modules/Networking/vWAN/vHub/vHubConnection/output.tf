# output "vhub_connections" {
#   value = {
#     for k, v in azurerm_virtual_hub_connection.peer_vnets_to_hub : k => {
#       id   = v.id
#       name = v.name
#     }
#   }
# }

output "id" {
  value = azurerm_virtual_hub_connection.peer_vnets_to_hub.id
}

output "name" {
  value = azurerm_virtual_hub_connection.peer_vnets_to_hub.name
}
