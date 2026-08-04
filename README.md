# tf-azurerm-module_primitive-servicebus_namespace

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Overview

This module is managed via the Launch Terraform skeleton.

## Usage

See [examples/complete](examples/complete) for a full working example.

## Module Development

### Pre-Requisites

The following commands should be available on your system:

- `asdf` or `mise`
- `make`
- `python3` (for pre-commit)

Additionally, your `git` user and email must be configured. Run the `make configure` command from the root of the repository to ensure that you meet these requirements.

### Pre-Commit hooks

The [.pre-commit-config.yaml](.pre-commit-config.yaml) file defines `pre-commit` hooks for Terraform formatting, validation, documentation generation, and detect-secrets. Hooks are installed when you run `make configure`. Go linting runs via `make lint` in local development and CI, not via pre-commit.

### Terratest examples

Post-deploy tests in `tests/post_deploy_functional/` and `tests/post_deploy_functional_readonly/` target `examples/complete` via an explicit folder constant in each `main_test.go`. Adding another example requires a new test entry point or updating that constant; it is not picked up automatically.

### Local Validation

You should validate the changes you make to any module locally, prior to pushing your changes in a branch to GitHub.

1. Ensure that you have run `make configure` successfully.
2. Ensure you are signed into the appropriate cloud provider (e.g. Azure) for the module under test in your current console session.
3. Run the Terraform and Golang linters:

```
make lint
```

4. Once linters pass, run integration tests (apply, test, destroy):

```
make test
```

The pre-commit validations, as well as the `make lint` and `make test` targets, are performed in CI. Running them locally before opening a PR helps ensure a smooth review.

### Review & Merge Process

Open a Pull Request to the default (`main`) branch. The PR title must follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification) format to merge and to drive semantic versioning.

Ensure CI workflows pass, address review feedback, and obtain approvals required by `CODEOWNERS`.

### Automatic Updates

Shared configuration and workflow files are largely managed through [launch-terraform-skeleton](https://github.com/launchbynttdata/launch-terraform-skeleton). Avoid one-off edits to copied skeleton files in this repository unless necessary (for example `.gitignore` entries for generated artifacts). Use `copier check-update` / `copier update` when refreshing from the skeleton.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.77 |

## Modules

No modules.

## Resources

| Name | Type |
|------|---------|
| [azurerm_servicebus_namespace.sb_namespace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/servicebus_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | The capacity of the Service Bus Namespace | `number` | `0` | no |
| <a name="input_configure_identity"></a> [configure\_identity](#input\_configure\_identity) | Should the identity be configured | `bool` | `true` | no |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of User Assigned Managed Identity IDs to be assigned | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The type of identity used for the Service Bus Namespace | `string` | `"SystemAssigned"` | no |
| <a name="input_local_auth_enabled"></a> [local\_auth\_enabled](#input\_local\_auth\_enabled) | Is local authentication enabled | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the Service Bus Namespace should be created | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The minimum TLS version | `string` | `"1.2"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Service Bus Namespace | `string` | n/a | yes |
| <a name="input_network_rule_set"></a> [network\_rule\_set](#input\_network\_rule\_set) | The Network Rule Set for the Service Bus Namespace | <pre>object({<br/>    default_action                = optional(string, "Allow")<br/>    public_network_access_enabled = optional(bool, true)<br/>    trusted_services_allowed      = optional(bool)<br/>    ip_rules                      = optional(list(string))<br/>  })</pre> | `null` | no |
| <a name="input_network_rules"></a> [network\_rules](#input\_network\_rules) | The Network Rules for the Service Bus Namespace | <pre>list(object({<br/>    subnet_id                            = string<br/>    ignore_missing_vnet_service_endpoint = optional(bool, false)<br/>  }))</pre> | `[]` | no |
| <a name="input_premium_messaging_partitions"></a> [premium\_messaging\_partitions](#input\_premium\_messaging\_partitions) | The number of partitions for Premium Messaging | `number` | `0` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Is public network access enabled | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which the Service Bus Namespace should be created | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Service Bus Namespace | `string` | `"Standard"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|---------|
| <a name="output_default_primary_connection_string"></a> [default\_primary\_connection\_string](#output\_default\_primary\_connection\_string) | The default primary connection string for the Service Bus Namespace |
| <a name="output_default_primary_key"></a> [default\_primary\_key](#output\_default\_primary\_key) | The default primary key for the Service Bus Namespace |
| <a name="output_default_secondary_connection_string"></a> [default\_secondary\_connection\_string](#output\_default\_secondary\_connection\_string) | The default secondary connection string for the Service Bus Namespace |
| <a name="output_default_secondary_key"></a> [default\_secondary\_key](#output\_default\_secondary\_key) | The default secondary key for the Service Bus Namespace |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The endpoint URL for the Service Bus Namespace |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Service Bus Namespace |
| <a name="output_identity"></a> [identity](#output\_identity) | The identity associated with the Service Bus Namespace |
| <a name="output_name"></a> [name](#output\_name) | The name of the Service Bus Namespace |
<!-- END_TF_DOCS -->