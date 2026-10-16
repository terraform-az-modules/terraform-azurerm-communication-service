provider "azurerm" {
  features {}
}

##-----------------------------------------------------------------------------
## Resource Group module call
## Resource group in which all resources will be deployed.
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "terraform-az-modules/resource-group/azurerm"
  version     = "1.0.3"
  name        = "core"
  environment = "dev"
  location    = "eastus"
  label_order = ["name", "environment", "location"]
}

##-----------------------------------------------------------------------------
## Communication Service Module Call
##-----------------------------------------------------------------------------
module "azcommunication" {
  source                    = "./../../"
  name                      = "core"
  environment               = "dev"
  resource_group_name       = module.resource_group.resource_group_name
  location                  = "United States"
  enable_domain             = true
  enable_domain_association = true
  domain_management         = "CustomerManaged"
  domain_name               = "mail.example.com"

  sender_usernames = {
    "noreply"       = "No Reply"             # noreply@mail.asterintel.ai
    "notifications" = "Aster Notifications" # notifications@mail.asterintel.ai
  }
}
