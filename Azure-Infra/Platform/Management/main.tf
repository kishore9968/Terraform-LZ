module "resource_groups" {
  for_each            = var.resource_groups
  source              = "../../../Modules/ResourceGroup"
  resource_group_name = join("-", ["rg","net","mgmt",var.location_prefix,each.value.name])
  tags                = each.value.tags
  location            = var.location
  #location_prefix     = var.location_prefix local.rg_name_prefix,
}

module "vnet" {
    source = "../../../Modules/Networking/VNet"

    location                    = var.location
    for_each                    = var.vnets
    resource_group_name         = module.resource_groups["001"].name
    # vnet_name                   = each.value.vnet_name
    vnet_name                   = join("-", ["vnet","mgmt","prod","mgmt",var.location_prefix])
    vnet_cidr                   = each.value.vnet_cidr
    #dns_servers                 = each.value.dns_servers
    tags                        = var.tags
    # enable_vhub_connection      = each.value.enable_vhub_connection
    # virtual_hub_id              = try(module.vhub[0].id, null)
    # virtual_hub_name            = try(module.vhub[0].name, null)
    subnets                     = each.value.subnets
    depends_on = [
        module.resource_groups["001"]
    ]
}

module "peering" {
  source = "../../../Modules/Networking/VNet/Peering"
  src_rg_name = module.resource_groups["001"].name
  dest_rg_name = data.terraform_remote_state.conn.outputs.rg.name
  src_vnet_name = module.vnet["mgmt"].vnets[0].name
  dest_vnet_name = data.terraform_remote_state.conn.outputs.vnet.name
  src_vnet_id = module.vnet["mgmt"].vnets[0].id
  dest_vnet_id = data.terraform_remote_state.conn.outputs.vnet.id
  depends_on = [ 
    module.resource_groups["001"],
    module.vnet["001"]
   ]

   providers = {
     azurerm.destination = azurerm.con
   }
}
