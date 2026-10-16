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

output "email_service_id" {
  description = "The ID of the Azure Email Communication Service resource."
  value       = try(azurerm_email_communication_service.main[0].id, "")
}

output "email_service_domain_id" {
  description = "The ID of the Azure Email Communication Service Domain resource."
  value       = try(azurerm_email_communication_service_domain.main[0].id, "")
}

output "domain_association_id" {
  description = "The ID of the Azure Communication Service Email Domain Association."
  value       = try(azurerm_communication_service_email_domain_association.main[0].id, "")
}

output "verification_records" {
  description = "The DNS verification records required for CustomerManaged email domains."
  value       = try(azurerm_email_communication_service_domain.main[0].verification_records, null)
}
