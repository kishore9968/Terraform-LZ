subscription_id         = "7c859d90-2d80-4b25-836c-df9e8f4982ce"
connectivity_subscription_id = "eed70f3e-5c19-4f38-9ae3-c41c3ddd565a"
#shared_subscription_id  = "41cf7a22-bca8-40b1-8afb-81da36e25597"
#citrix_subscription_id  = "41cf7a22-bca8-40b1-8afb-81da36e25597"

# Project Details
location            = "eastus2"
location_prefix     = "eus2"
project_name_prefix = ""

# Tags
tags = {}

# dest_rg_name = "rg-net-conn-eus2-001"

# Resource Groups
resource_groups = {
  "001" = {
    name = "001",
    tags = {}
  }
  # "net" = {
  #   name = "net",
  #   tags = {}
  # }
  # "vhub" = {
  #   name = "vhub",
  #   tags = {}
  # }
}

vnets = {
  "mgmt" = {
    vnet_name              = "001"
    vnet_cidr              = ["10.10.204.0/23"]
    # dns_servers            = ["10.0.4.4"]
    # enable_vhub_connection = true
    subnets = [
    #   {
    #     subnet_name                  = "pvt-snet"
    #     subnet_cidr_list             = ["10.0.1.0/24"]
    #     network_security_group_rules = {
    #       rule1 = {
    #         name                       = "allow_http"
    #         priority                   = 100
    #         direction                  = "Inbound"
    #         access                     = "Allow"
    #         protocol                   = "Tcp"
    #         destination_port_range    = "80"
    #         source_port_range          = "*"
    #         source_address_prefix      = "*"
    #         destination_address_prefix = "*"
    # }
    #     }
    #     network_security_group_name  = ""
    #     subnet_delegation            = []
    #   },
      {
        subnet_name                  = "Management"
        subnet_cidr_list             = ["10.10.204.0/24"]
        network_security_group_rules = {}
        network_security_group_name  = ""
        subnet_delegation            = []
      },
      # {
      #   subnet_name                  = "DNS_In"
      #   subnet_cidr_list             = ["10.10.201.0/25"]
      #   network_security_group_rules = {}
      #   network_security_group_name  = ""
      #   subnet_delegation            = []
      # },
      # {
      #   subnet_name                  = "DNS_Out"
      #   subnet_cidr_list             = ["10.10.201.128/25"]
      #   network_security_group_rules = {}
      #   network_security_group_name  = ""
      #   subnet_delegation            = []
      # },

    ]
  }
}
      # {
      #   subnet_name                  = "dns-in-ded-snet"
      #   subnet_cidr_list             = ["10.0.3.0/24"]
      #   network_security_group_rules = {}
      #   network_security_group_name  = ""
      #   subnet_delegation = [{
      #     name = "Microsoft.Network.dnsResolvers"
      #     service_delegation = {
      #       name    = "Microsoft.Network/dnsResolvers"
      #       actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      #     }
      #   }]
      # },
    #   {
    #     subnet_name      = "dns-out-ded-snet"
    #     subnet_cidr_list = ["10.0.5.0/24"]
    #     subnet_delegation = [{
    #       name = "Microsoft.Network.dnsResolvers"
    #       service_delegation = {
    #         name    = "Microsoft.Network/dnsResolvers"
    #         actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
    #       }
    #     }]
    #     network_security_group_rules = {}
    #     network_security_group_name  = ""
    #   }
    # ]
    # ap_route_table_name = "Default"

  # }
  # "pa-net" = {
  #   vnet_name              = "pa-vnet"
  #   vnet_cidr              = ["10.1.0.0/16"]
  #   dns_servers            = ["10.1.4.4"]
  #   enable_vhub_connection = true
  #   subnets = [
  #     {
  #       subnet_name                  = "pa-pvt-snet"
  #       subnet_cidr_list             = ["10.1.1.0/24"]
  #       network_security_group_rules = {}
  #       network_security_group_name  = ""
  #       subnet_delegation            = []
  #     },
  #     {
  #       subnet_name                  = "pa-pub-snet"
  #       subnet_cidr_list             = ["10.1.2.0/24"]
  #       network_security_group_rules = {}
  #       network_security_group_name  = ""
  #       subnet_delegation            = []
  #     },
  #     {
  #       subnet_name                  = "mgmt-snet"
  #       subnet_cidr_list             = ["10.1.3.0/24"]
  #       network_security_group_rules = {}
  #       network_security_group_name  = ""
  #       subnet_delegation            = []
  #     }
  #   ]
  #   ap_route_table_name = "Default"

  # }
# }

# vwan = {
#   type      = "Standard"
#   vwan_name = "vwan"
# }

# vhub = {
#   sku            = "Standard"
#   address_prefix = "10.200.0.0/24"
#   vhub_name      = "vhub"
# }
