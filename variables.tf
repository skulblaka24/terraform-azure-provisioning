#Define vars
variable "locationName" {
  type = string
  description = "Name for the location naming and domain"
  default = "fr"
}
variable "locationRg" {
  type = string
  description = "Name of the DC"
  default = "France Central"
}
variable "instance" {
  type = string
  description = "Type of the instance"
  default = "Standard_B1ls"
}
variable "environment" {
  type = string
  description = "Name of environment"
  default = "demo-dev"
}
variable "linux_password" {
  type = string
  description = "Password of the VM, set with TFE/TFC sensitive variable"
}
