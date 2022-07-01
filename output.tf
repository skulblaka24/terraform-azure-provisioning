#Outputs az file
output "ip-pub" {
  description = "Show the link to the website deployed"
  value = "http://${module.moduledemo-website.ip-public}"
}
