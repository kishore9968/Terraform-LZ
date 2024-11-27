output "resourcegroup" {
  value = length(module.vnet) > 0 ? {
    id   = module.vnet["iden"].vnets[0].id
    name = module.vnet["iden"].vnets[0].name
  } : null
}

# output "subnet_name_and_id" {
#   value = {
#     for k1, snet in module.vnet.subnet_name_and_id : k1 => {
#       "name" = snet.name
#       "id"   = snet.id
#     }
#   }
#   }

# output "subnet_name_and_id" {
#   value = module.vnet.subnet_name_and_id  # This should match the output defined in the VNet module
# }


# output "first_snet" {
#   value = module.vnet["net"].snets["vnet-net-prod-net-eus2-001.0.GatewaySubnet"]
# }