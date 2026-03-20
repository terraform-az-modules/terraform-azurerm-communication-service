##-----------------------------------------------------------------------------
## Outputs
##-----------------------------------------------------------------------------

output "communication_service_id" {
  description = "The ID of the Azure Communication Service resource."
  value       = try(azurerm_communication_service.main[0].id, "")
}

output "primary_connection_string" {
  description = "The primary connection string used to access the Azure Communication Service."
  value       = try(azurerm_communication_service.main[0].primary_connection_string, "")
  sensitive   = true
}

output "secondary_connection_string" {
  description = "The secondary connection string used to access the Azure Communication Service."
  value       = try(azurerm_communication_service.main[0].secondary_connection_string, "")
  sensitive   = true
}

output "primary_key" {
  description = "The primary access key for the Azure Communication Service."
  value       = try(azurerm_communication_service.main[0].primary_key, "")
  sensitive   = true
}

output "secondary_key" {
  description = "The secondary access key for the Azure Communication Service."
  value       = try(azurerm_communication_service.main[0].secondary_key, "")
  sensitive   = true
}
