// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

resource "azurerm_servicebus_namespace" "sb_namespace" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  capacity                      = var.capacity
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled
  premium_messaging_partitions  = var.premium_messaging_partitions
  local_auth_enabled            = var.local_auth_enabled

  dynamic "identity" {
    for_each = var.configure_identity ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }

  dynamic "network_rule_set" {
    for_each = var.network_rule_set != null ? [1] : []
    content {
      default_action                = var.network_rule_set.default_action
      public_network_access_enabled = var.network_rule_set.public_network_access_enabled
      trusted_services_allowed      = var.network_rule_set.trusted_services_allowed
      ip_rules                      = var.network_rule_set.ip_rules
      dynamic "network_rules" {
        for_each = var.network_rules
        content {
          subnet_id                            = network_rules.value.subnet_id
          ignore_missing_vnet_service_endpoint = network_rules.value.ignore_missing_vnet_service_endpoint
        }
      }
    }
  }
  tags = var.tags
}
