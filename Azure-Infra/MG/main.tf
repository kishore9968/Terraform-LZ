data "azurerm_client_config" "core" {}
data "azurerm_subscription" "current" {
  subscription_id = data.azurerm_client_config.core.subscription_id
}

locals {
  tenant_name_prefix = upper(var.tenant_prefix)

  // root
  root_display_name = "${local.tenant_name_prefix}dynamic"
  root_id           = "${var.tenant_prefix}${var.prefix}-root"

  // Platforms
  platform_root_id      = "${var.tenant_prefix}${var.prefix}-platform"
  platform_display_name = "${local.tenant_name_prefix}Platform"
  connectivity_root_id         = "${var.tenant_prefix}${var.prefix}-connectivity"
  connectivity_display_name    = "${local.tenant_name_prefix}connectivity"
  identity_root_id      = "${var.tenant_prefix}${var.prefix}-identity"
  identity_display_name = "${local.tenant_name_prefix}identity"
  management_root_id          = "${var.tenant_prefix}${var.prefix}-management"
  management_display_name     = "${local.tenant_name_prefix}management"
  landing_zones_root_id           = "${var.tenant_prefix}${var.prefix}-landingzone"
  landing_zones_display_name      = "${local.tenant_name_prefix}landingzone"
  corp_root_id         = "${var.tenant_prefix}${var.prefix}-corp"
  corp_display_name    = "${local.tenant_name_prefix}Corp"
  online_root_id         = "${var.tenant_prefix}${var.prefix}-online"
  online_display_name    = "${local.tenant_name_prefix}Online"
 

  // Sandbox 
  sandbox_root_id         = "${var.tenant_prefix}${var.prefix}-sandbox"
  sandbox_display_name    = "${local.tenant_name_prefix}Sandbox"
  /*sandbox_cp_root_id      = "${var.tenant_prefix}${var.prefix}-sb-cp"
  sandbox_cp_display_name = "${local.tenant_name_prefix}sb-cp Workloads"
  sandbox_ol_root_id      = "${var.tenant_prefix}${var.prefix}-sb-ol"
  sandbox_ol_display_name = "${local.tenant_name_prefix}sb-ol Workloads"

  // Corporate Names
  
  corporate_np_root_id      = "${var.tenant_prefix}${var.prefix}-np-cp"
  corporate_np_display_name = "${local.tenant_name_prefix}np-cp Workloads"
  corporate_pr_root_id      = "${var.tenant_prefix}${var.prefix}-pr-cp"
  corporate_pr_display_name = "${local.tenant_name_prefix}pr-cp Workloads"

  // online names 
 
  online_np_root_id      = "${var.tenant_prefix}${var.prefix}-np-ol"
  online_np_display_name = "${local.tenant_name_prefix}np-ol Workloads"
  online_pr_root_id      = "${var.tenant_prefix}${var.prefix}-pr-ol"
  online_pr_display_name = "${local.tenant_name_prefix}pr-ol Workloads"

  // FOR HOLDING MG
  holding_root_id      = "${var.tenant_prefix}${var.prefix}-holding"
  holding_display_name = "${local.tenant_name_prefix}Holding MG"*/
}

/*locals {
  subp_name_list              = split("-", data.azurerm_subscription.current.display_name)
  is_tt                       = local.subp_name_list[0] == "tt" ? true : false
  resource_prefix             = local.is_tt == true ? "tt-" : ""
  backend_resource_group_name = "${local.resource_prefix}rg-tf-inf-pr-eus-001"
  backend_sa_name             = "${trim(local.resource_prefix, "-")}corningsttfinfeus001"
}*/


module "management_groups" {

  source = "../../Modules/ManagementGroups"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = local.root_id
  root_name      = local.root_display_name
  library_path   = "${path.root}/lib"

  deploy_core_landing_zones = false

  custom_landing_zones = {
    "${local.root_id}" = {
      display_name               = local.root_display_name
      parent_management_group_id = data.azurerm_client_config.core.tenant_id
      subscription_ids           = []
      archetype_config = {
        archetype_id = "default_empty"
        parameters = {}
        access_control = {}
      }
    }
    "${local.platform_root_id}" = {
      display_name               = local.platform_display_name
      parent_management_group_id = local.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.connectivity_root_id}" = {
      display_name               = local.connectivity_display_name
      parent_management_group_id = local.platform_root_id
      subscription_ids           = var.dynamic_connectivity_subs
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.identity_root_id}" = {
      display_name               = local.identity_display_name
      parent_management_group_id = local.platform_root_id
      subscription_ids           = var.dynamic_identity_subs
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.management_root_id}" = {
      display_name               = local.management_display_name
      parent_management_group_id = local.platform_root_id
      subscription_ids           = var.dynamic_management_subs
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
     "${local.sandbox_root_id}" = {
      display_name               = local.sandbox_display_name
      parent_management_group_id = local.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
     "${local.landing_zones_root_id }" = {
      display_name               = local.landing_zones_display_name 
      parent_management_group_id = local.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id = "default_empty"
        parameters = {}
        access_control = {}
      }
    }
    "${local.corp_root_id}" = {
      display_name               = local.corp_display_name
      parent_management_group_id = local.landing_zones_root_id
      subscription_ids           = var.dynamic_corp_subs
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.online_root_id}" = {
      display_name               = local.online_display_name
      parent_management_group_id = local.landing_zones_root_id
      #subscription_ids           = var.sec_pr_subs
      subscription_ids           = var.dynamic_online_subs
      archetype_config = {
        #archetype_id   = "sec"
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
   
    /*"${local.core_root_id}" = {
      display_name               = local.core_display_name
      parent_management_group_id = local.platform_root_id
      #subscription_ids           = var.cor_pr_subs
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.workload_root_id}" = {
      display_name               = local.workload_display_name
      parent_management_group_id = local.root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }

    "${local.corporate_root_id}" = {
      display_name               = local.corporate_display_name
      parent_management_group_id = local.workload_root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.corporate_pr_root_id}" = {
      display_name               = "${local.corporate_pr_display_name}"
      parent_management_group_id = local.corporate_root_id
      #subscription_ids           = var.cp_pr_subs
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.corporate_np_root_id}" = {
      display_name               = "${local.corporate_np_display_name}"
      parent_management_group_id = local.corporate_root_id
      #subscription_ids           = var.cp_np_subs
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }*/

   
    /*"${local.sandbox_cp_root_id}" = {
      display_name               = local.sandbox_cp_display_name
      parent_management_group_id = local.sandbox_root_id
      #subscription_ids           = var.sb_cp_subs
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.sandbox_ol_root_id}" = {
      display_name               = local.sandbox_ol_display_name
      parent_management_group_id = local.sandbox_root_id
      #subscription_ids           = var.sb_ol_subs
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }

    "${local.online_root_id}" = {
      display_name               = local.online_display_name
      parent_management_group_id = local.workload_root_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.online_pr_root_id}" = {
      display_name               = "${local.online_pr_display_name}"
      parent_management_group_id = local.online_root_id
      #subscription_ids           = var.ol_pr_subs
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    "${local.online_np_root_id}" = {
      display_name               = "${local.online_np_display_name}"
      parent_management_group_id = local.online_root_id
      #subscription_ids           = var.ol_np_subs
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }
    // holding root MG
    "${local.holding_root_id}" = {
      display_name               = local.holding_display_name
      parent_management_group_id = data.azurerm_client_config.core.tenant_id
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "default_empty"
        parameters     = {}
        access_control = {}
      }
    }*/
  }
}

module "rbac" {
  count                = length(var.rbac)
  source               = "../../Modules/Identity/RBAC/RoleAssignment"
  scope                = "/providers/Microsoft.Management/managementGroups/${var.tenant_prefix}${var.prefix}-${var.rbac[count.index].scope}"
  principal_ids        = var.rbac[count.index].principal_ids
  role_definition_name = var.rbac[count.index].role_definition_name
  role_definition_id   = var.rbac[count.index].role_definition_id
  depends_on = [
    module.management_groups
  ]
}
