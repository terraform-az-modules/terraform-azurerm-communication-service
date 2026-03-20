##-----------------------------------------------------------------------------
## Tagging Module – Applies standard tags to all resources
##-----------------------------------------------------------------------------
module "labels" {
  source          = "terraform-az-modules/tags/azurerm"
  version         = "1.0.2"
  name            = var.custom_name == null ? var.name : var.custom_name
  location        = var.location
  environment     = var.environment
  managedby       = var.managedby
  label_order     = var.label_order
  repository      = var.repository
  deployment_mode = var.deployment_mode
  extra_tags      = var.extra_tags
}

##-----------------------------------------------------------------------------
## Azure Communication Service resource creation
##-----------------------------------------------------------------------------
resource "azurerm_communication_service" "main" {
  count               = var.enable ? 1 : 0
  name                = var.resource_position_prefix ? format("acs-%s", local.name) : format("%s-acs", local.name)
  resource_group_name = var.resource_group_name
  data_location       = var.location
  tags                = module.labels.tags
}

resource "azurerm_communication_service_email_domain_association" "main" {
  count                    = var.enable && var.enable_domain ? 1 : 0
  communication_service_id = azurerm_communication_service.main[0].id
  email_service_domain_id  = azurerm_email_communication_service_domain.main[0].id
}

##-----------------------------------------------------------------------------
## Azure Communication Email Service resource creation
##-----------------------------------------------------------------------------
resource "azurerm_email_communication_service" "main" {
  count               = var.enable ? 1 : 0
  name                = var.resource_position_prefix ? format("aecs-%s", local.name) : format("%s-aecs", local.name)
  resource_group_name = var.resource_group_name
  data_location       = var.location
  tags                = module.labels.tags
}

##-----------------------------------------------------------------------------
## Email domain association for the Azure Communication Service
##-----------------------------------------------------------------------------
resource "azurerm_email_communication_service_domain" "main" {
  count                            = var.enable && var.enable_domain ? 1 : 0
  name                             = var.domain_management == "CustomerManaged" ? null : "AzureManagedDomain"
  email_service_id                 = azurerm_email_communication_service.main[0].id
  user_engagement_tracking_enabled = var.user_engagement_tracking_enabled
  domain_management                = var.domain_management
  tags                             = module.labels.tags
}
