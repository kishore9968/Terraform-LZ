prefix        = "dynamic"
tenant_prefix = ""

#infra_pr_subs = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#sec_pr_subs   = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#cor_pr_subs   = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#net_pr_subs   = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#cp_pr_subs    = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#cp_np_subs    = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#ol_np_subs    = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#ol_pr_subs    = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#sb_cp_subs    = ["8ab0c852-8b10-4366-9cf9-15606f487d6a"]
#sb_ol_subs    = [] // no subs as of now

dynamic_connectivity_subs = ["eed70f3e-5c19-4f38-9ae3-c41c3ddd565a"]
dynamic_corp_subs         = ["7d8140b7-f7e4-43d6-b6a8-b325e124a5af"]
dynamic_identity_subs     = ["5689a59e-5afb-46e5-8756-4c1922521616"]
dynamic_management_subs   = ["7c859d90-2d80-4b25-836c-df9e8f4982ce"]
dynamic_online_subs       = ["396fd2cf-c252-466a-9c3f-2b1b9fd4f8c4"]

// pass the scope (ID of management groups in azure portal) without prefix and tenant_prefix defined above
rbac = [
  {
    scope                = "root"
    role_definition_name = "Contributor"
    principal_ids = [
      "4e7ac6f0-fabb-4d7a-b0d2-6c75ebb2ec2f"
    ]
  },
  /*{
    scope                = "security"
    role_definition_name = "Contributor"
    principal_ids = [
      "9b40a09e-faa3-48cb-bf16-30afce937d81"
      this users objectid
    ]
  },
  {
    scope   = "sandbox"
    role_definition_name = "Contributor"
    principal_ids = [
      "9b40a09e-faa3-48cb-bf16-30afce937d81"
    ]
  }*/
]
