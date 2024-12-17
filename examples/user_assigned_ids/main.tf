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

module "resource_names" {
  source  = "terraform.registry.launch.nttdata.com/module_library/resource_name/launch"
  version = "~> 2.0"

  for_each = var.resource_names_map

  logical_product_family  = var.product_family
  logical_product_service = var.product_service
  region                  = join("", split("-", var.region))
  class_env               = var.environment
  cloud_resource_type     = each.value.name
  instance_env            = var.environment_number
  instance_resource       = var.resource_number
  maximum_length          = each.value.max_length
}

module "resource_group" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm"
  version = "~> 1.0"

  name       = module.resource_names["rg"].minimal_random_suffix
  location   = var.region
  tags       = local.tags
  managed_by = var.managed_by
}

module "user_assigned_identity" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/user_managed_identity/azurerm"
  version = "~> 1.0"

  count = 2

  resource_group_name         = module.resource_group.name
  location                    = var.region
  user_assigned_identity_name = "${module.resource_names["msi"].minimal_random_suffix}_${count.index}"
  tags                        = local.tags

  depends_on = [module.resource_group]
}

module "servicebus_namespace" {
  source = "../.."

  resource_group_name = module.resource_group.name
  name                = module.resource_names["sb_namespace"].minimal_random_suffix
  location            = var.region
  sku                 = var.sku
  identity_type       = "UserAssigned"
  identity_ids        = module.user_assigned_identity[*].id

  tags = local.tags

  depends_on = [module.resource_group]
}