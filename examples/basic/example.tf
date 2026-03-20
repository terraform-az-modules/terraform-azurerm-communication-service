provider "azurerm" {
  features {}
}

module "communication-service" {
  source = "../../"
}
