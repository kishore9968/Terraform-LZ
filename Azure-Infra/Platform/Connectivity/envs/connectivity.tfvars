subscription_id         = "eed70f3e-5c19-4f38-9ae3-c41c3ddd565a"
connectivity_subscription_id = "eed70f3e-5c19-4f38-9ae3-c41c3ddd565a"
#shared_subscription_id  = "41cf7a22-bca8-40b1-8afb-81da36e25597"
#citrix_subscription_id  = "41cf7a22-bca8-40b1-8afb-81da36e25597"

# Project Details
location            = "East US 2"
location_prefix     = "eus2"
project_name_prefix = "kishore"

# Tags
tags = {}

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
  "con" = {
    vnet_name              = "001"
    vnet_cidr              = ["10.10.202.0/23"]
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
    #   {
    #     subnet_name                  = "pub-snet"
    #     subnet_cidr_list             = ["10.0.2.0/24"]
    #     network_security_group_rules = {}
    #     network_security_group_name  = ""
    #     subnet_delegation            = []
    #   },
      {
        subnet_name                  = "GatewaySubnet"
        subnet_cidr_list             = ["10.10.202.0/26"]
        network_security_group_rules = {}
        #network_security_group_name  = "GatewaySubnet"
        subnet_delegation            = []
      }
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

vpn = {
  public_ip_allocation_method = "Static"
  public_ip_sku               = "Standard"
  gateway_type                = "Vpn"
  vpn_type                    = "RouteBased"
  vpn_gw_sku                  = "VpnGw1"
  vpn_gw_generation           = "Generation1"
  local_networks = [
  {
    local_gateway_address      = "208.240.37.2"
    local_address_space    = ["0.0.0.0/0"]
    shared_key = ""
  }
  ]
}