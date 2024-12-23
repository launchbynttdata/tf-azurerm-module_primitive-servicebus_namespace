output "id" {
  value = module.servicebus_namespace.id
}

output "identity" {
  value = module.servicebus_namespace.identity
}

output "endpoint" {
  value = module.servicebus_namespace.endpoint
}

output "name" {
  value = module.servicebus_namespace.name
}

output "default_primary_connection_string" {
  description = "The default primary connection string for the Service Bus Namespace"
  value       = module.servicebus_namespace.default_primary_connection_string
  sensitive   = true
}

output "default_secondary_connection_string" {
  description = "The default secondary connection string for the Service Bus Namespace"
  value       = module.servicebus_namespace.default_secondary_connection_string
  sensitive   = true
}

output "default_primary_key" {
  description = "The default primary key for the Service Bus Namespace"
  value       = module.servicebus_namespace.default_primary_key
  sensitive   = true
}

output "default_secondary_key" {
  description = "The default secondary key for the Service Bus Namespace"
  value       = module.servicebus_namespace.default_secondary_key
  sensitive   = true
}
