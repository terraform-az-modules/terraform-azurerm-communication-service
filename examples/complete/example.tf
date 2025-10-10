provider "azurerm" {
  features {}
}

##-----------------------------------------------------------------------------
## Resource Group module call
## Resource group in which all resources will be deployed.
##-----------------------------------------------------------------------------
module "resource_group" {
  source      = "terraform-az-modules/resource-group/azure"
  version     = "1.0.1"
  name        = "core"
  environment = "dev"
  location    = "eastus"
  label_order = ["name", "environment", "location"]
}

##-----------------------------------------------------------------------------
## Communication Service Module Call
##-----------------------------------------------------------------------------
module "azcommunication" {
  source              = "./../../"
  name                = "core"
  environment         = "dev"
  resource_group_name = module.resource_group.resource_group_name
  location            = "India"
}