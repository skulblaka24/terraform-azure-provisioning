module "moduledemo-website" {
  source  = "app.terraform.io/rs-tfc-yt/moduledemo-website/azure"
  version = "~> 0.0.1"
  rg_location = var.locationRg
  loc = var.locationName
  instance_type = var.instance
  app_environment = var.environment
  linux_admin_password = var.linux_password
}
