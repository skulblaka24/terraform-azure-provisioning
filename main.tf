module "moduledemo-website" {
  source  = "app.terraform.io/gauth/azure-demo-website/module"
  rg_location = var.locationRg
  loc = var.locationName
  instance_type = var.instance
  app_environment = var.environment
  linux_admin_password = var.linux_password
}
