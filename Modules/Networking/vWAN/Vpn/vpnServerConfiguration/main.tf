resource "azurerm_vpn_server_configuration" "vpn_server" {
  name                     = var.vpn_server_config_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  vpn_authentication_types = var.vpn_authentication_types

  dynamic "client_root_certificate" {
    for_each = contains(var.vpn_authentication_types, "Certificate") == true ? var.client_root_certificate : []
    content {
      name             = client_root_certificate.value.name
      public_cert_data = client_root_certificate.value.public_cert_data
    }
  }

  dynamic "client_revoked_certificate" {
    for_each = contains(var.vpn_authentication_types, "Certificate") == true ? var.client_root_certificate : []
    content {
      name       = client_revoked_certificate.name
      thumbprint = client_revoked_certificate.thumbprint
    }
  }

  dynamic "azure_active_directory_authentication" {
    for_each = contains(var.vpn_authentication_types, "AAD") == true ? [true] : []
    content {
      audience = var.azure_active_directory_authentication.audience
      issuer   = var.azure_active_directory_authentication.issuer
      tenant   = var.azure_active_directory_authentication.tenant
    }
  }

  dynamic "radius" {
    for_each = contains(var.vpn_authentication_types, "Radius") == true ? [true] : []
    content {
      dynamic "server" {
        for_each = var.radius_configuration.server
        content {
          address = server.value.address
          secret  = server.value.secret
          score   = server.value.score
        }
      }

      dynamic "client_root_certificate" {
        for_each = var.radius_configuration.client_root_certificate == null ? [] : var.radius_configuration.client_root_certificate
        content {
          name       = client_root_certificate.value.name
          thumbprint = client_root_certificate.value.thumbprint
        }
      }

      dynamic "server_root_certificate" {
        for_each = var.radius_configuration.server_root_certificate == null ? [] : var.radius_configuration.server_root_certificate
        content {
          name             = server_root_certificate.value.name
          public_cert_data = server_root_certificate.value.public_cert_data
        }
      }
    }
  }

  dynamic "ipsec_policy" {
    for_each = var.ipsec_policy != null ? [true] : []
    content {
      dh_group               = ipsec_policy.value.dh_group
      ike_encryption         = ipsec_policy.value.ike_encryption
      ike_integrity          = ipsec_policy.value.ike_integrity
      ipsec_encryption       = ipsec_policy.value.ipsec_encryption
      ipsec_integrity        = ipsec_policy.value.ipsec_integrity
      pfs_group              = ipsec_policy.value.pfs_group
      sa_lifetime_seconds    = ipsec_policy.value.sa_lifetime_seconds
      sa_data_size_kilobytes = ipsec_policy.value.sa_data_size_kilobytes
    }
  }
  vpn_protocols = var.vpn_protocols

  tags = var.tags
}
