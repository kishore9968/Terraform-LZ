# output "vnet_id" {
#   value = azurerm_virtual_network.vnet.id
# }

# output "vnet_name" {
#   value = azurerm_virtual_network.vnet.name
# }
output "vnets" {
  value = {
    for k1, vnet in azurerm_virtual_network.vnet : k1 => {
      "name" = vnet.name
      "id"   = vnet.id
    }
  }
}

output "snets" {
  value = {
    for k, subnet in module.snet : k => subnet.subnet_id
  }
}

# output "snet_nsgs" {
#   value = [
#     for k, subnet in module.snet : {
#       id   = subnet.nsg_id
#       name = subnet.nsg_name
#     }
#   ]
# }


# output "subnet_name_and_id" {
#   value = {
#     for k1, snet in module.snet : k1 => {
#       #"name" = snet.subnet_name
#       "id"   = snet.subnet_id
#     }
#   }
#   }

