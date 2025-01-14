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

variable "product_family" {
  description = <<EOF
    (Required) Name of the product family for which the resource is created.
    Example: org_name, department_name.
  EOF
  type        = string
  default     = "dso"
}

variable "product_service" {
  description = <<EOF
    (Required) Name of the product service for which the resource is created.
    For example, backend, frontend, middleware etc.
  EOF
  type        = string
  default     = "terratest"
}

variable "region" {
  description = "AWS Region in which the infra needs to be provisioned"
  type        = string
  default     = "eastus"
}

variable "sku" {
  description = "The SKU of the Service Bus Namespace"
  type        = string
  default     = "Standard"
}

variable "configure_identity" {
  description = "Should the identity be configured"
  type        = bool
}

variable "identity_type" {
  description = "The type of identity used for the Service Bus Namespace"
  type        = string
}

variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-launch-module_library-resource_name to generate resource names"
  type = map(object(
    {
      name       = string
      max_length = optional(number, 60)
    }
  ))
  default = {
    rg = {
      name       = "rg"
      max_length = 60
    }
    sb_namespace = {
      name       = "sbn"
      max_length = 60
    }
    vnet = {
      name       = "vnet"
      max_length = 60
    }
  }
}

variable "environment" {
  description = "Environment in which the resource should be provisioned like dev, qa, prod etc."
  type        = string
  default     = "dev"
}

variable "environment_number" {
  description = "The environment count for the respective environment. Defaults to 000. Increments in value of 1"
  type        = string
  default     = "000"
}

variable "resource_number" {
  description = "The resource count for the respective resource. Defaults to 000. Increments in value of 1"
  type        = string
  default     = "000"
}

variable "tags" {
  description = "(Optional) A mapping of tags which should be assigned to the identity."
  type        = map(string)
  default     = {}
}

variable "managed_by" {
  description = "(Optional) The ID of the resource that manages this resource group."
  type        = string
  default     = null
}

variable "address_space" {
  description = "The address space used by the Virtual Network"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "A mapping of subnet names to their configurations."
  type = map(object({
    prefix = string
    delegation = optional(map(object({
      service_name    = string
      service_actions = list(string)
    })), {})
    service_endpoints                             = optional(list(string), []),
    private_endpoint_network_policies_enabled     = optional(bool, false)
    private_link_service_network_policies_enabled = optional(bool, false)
    network_security_group_id                     = optional(string, null)
    route_table_id                                = optional(string, null)
  }))
  default = {}
}

variable "network_rule_set" {
  description = "The Network Rule Set for the Service Bus Namespace"
  type = object({
    default_action                = optional(string, "Allow")
    public_network_access_enabled = optional(bool, true)
    trusted_services_allowed      = optional(bool)
    ip_rules                      = optional(list(string))
  })
  default = null
}

variable "capacity" {
  description = "The capacity of the Service Bus Namespace"
  type        = number
  default     = 0
}

variable "premium_messaging_partitions" {
  description = "The number of partitions for Premium Messaging"
  type        = number
  default     = 0
}
