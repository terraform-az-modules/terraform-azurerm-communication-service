##-----------------------------------------------------------------------------
## Naming convention
##-----------------------------------------------------------------------------
variable "custom_name" {
  type        = string
  default     = null
  description = "Override default naming convention"
}

variable "resource_position_prefix" {
  type        = bool
  default     = true
  description = <<EOT
Controls the placement of the resource type keyword (e.g., "vnet", "ddospp") in the resource name.

- If true, the keyword is prepended: "vnet-core-dev".
- If false, the keyword is appended: "core-dev-vnet".

This helps maintain naming consistency based on organizational preferences.
EOT
}

##-----------------------------------------------------------------------------
## Labels
##-----------------------------------------------------------------------------
variable "name" {
  type        = string
  default     = null
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "location" {
  type        = string
  default     = null
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
}

variable "environment" {
  type        = string
  default     = null
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "managedby" {
  type        = string
  default     = "terraform-az-modules"
  description = "ManagedBy, eg 'terraform-az-modules'."
}

variable "label_order" {
  type        = list(string)
  default     = ["name", "environment", "location"]
  description = "The order of labels used to construct resource names or tags. If not specified, defaults to ['name', 'environment', 'location']."
}

variable "repository" {
  type        = string
  default     = "https://github.com/terraform-az-modules/terraform-azure-vnet"
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "deployment_mode" {
  type        = string
  default     = "terraform"
  description = "Specifies how the infrastructure/resource is deployed"
}

variable "extra_tags" {
  type        = map(string)
  default     = null
  description = "Variable to pass extra tags."
}
##-----------------------------------------------------------------------------
## Communication Service
##-----------------------------------------------------------------------------
variable "enable" {
  type        = bool
  default     = true
  description = "Flag to control the module creation"
}

variable "resource_group_name" {
  type        = string
  default     = null
  description = "The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}

variable "enable_domain" {
  type        = bool
  default     = true
  description = "Flag to create service domain."
}
variable "user_engagement_tracking_enabled" {
  type        = bool
  default     = false
  description = "Describes user engagement tracking is enabled or disabled."
}

variable "domain_management" {
  description = "Configuration for Domain Management"
  type        = string
  default     = "AzureManaged"
}