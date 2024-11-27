<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_management_groups"></a> [management\_groups](#module\_management\_groups) | Azure/caf-enterprise-scale/azurerm | 2.1.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.core](https://registry.terraform.io/providers/hashicorp/azurerm/3.14.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cor_np_subs"></a> [cor\_np\_subs](#input\_cor\_np\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_cor_pr_subs"></a> [cor\_pr\_subs](#input\_cor\_pr\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_cp_np_subs"></a> [cp\_np\_subs](#input\_cp\_np\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_cp_pr_subs"></a> [cp\_pr\_subs](#input\_cp\_pr\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_infra_np_subs"></a> [infra\_np\_subs](#input\_infra\_np\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_infra_pr_subs"></a> [infra\_pr\_subs](#input\_infra\_pr\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_net_np_subs"></a> [net\_np\_subs](#input\_net\_np\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_net_pr_subs"></a> [net\_pr\_subs](#input\_net\_pr\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_ol_np_subs"></a> [ol\_np\_subs](#input\_ol\_np\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_ol_pr_subs"></a> [ol\_pr\_subs](#input\_ol\_pr\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_sb_subs"></a> [sb\_subs](#input\_sb\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_sec_np_subs"></a> [sec\_np\_subs](#input\_sec\_np\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_sec_pr_subs"></a> [sec\_pr\_subs](#input\_sec\_pr\_subs) | (optional) describe your variable | `list(string)` | n/a | yes |
| <a name="input_tenant_prefix"></a> [tenant\_prefix](#input\_tenant\_prefix) | (optional) describe your variable | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->