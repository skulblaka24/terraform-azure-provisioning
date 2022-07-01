terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.76.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

module "moduledemo-website" {
  source  = "app.terraform.io/gauth/azure-demo-website/module"
  rg_location = var.locationRg
  loc = var.locationName
  instance_type = var.instance
  app_environment = var.environment
  linux_admin_password = var.linux_password
}
