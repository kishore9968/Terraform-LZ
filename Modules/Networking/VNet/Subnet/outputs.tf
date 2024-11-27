output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

# output "nsg_name" {
#   value = var.network_security_group_name == null ? module.nsg[0].network_security_group_name : var.network_security_group_name
# }

# output "nsg_id" {
#   value = var.network_security_group_name == null ? module.nsg[0].network_security_group_id : var.network_security_group_name
# }

# output "subnet_name" {
#   value = azurerm_subnet.subnet.name
# }


