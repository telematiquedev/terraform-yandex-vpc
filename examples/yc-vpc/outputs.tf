output "network_id" {
  description = "Yandex network id"
  value       = module.vpc.network_id
}

output "subnets_locations" {
  description = "Mapping Subnet Name to Subnet ID"
  value       = module.vpc.subnets_locations
}