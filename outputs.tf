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

output "id" {
  description = "The ID of the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.sb_namespace.id
}

output "identity" {
  description = "The identity associated with the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.sb_namespace.identity
}

output "endpoint" {
  description = "The endpoint URL for the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.sb_namespace.endpoint
}

output "name" {
  description = "The name of the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.sb_namespace.name
}
