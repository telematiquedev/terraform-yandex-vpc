output "network_id" {
  description = "Yandex network id"
  value       = try(yandex_vpc_network.yc_network.id, "")
}

output "subnets_locations" {
  description = "Mapping Subnet Name to Subnet ID"
  value = [
    for s in yandex_vpc_subnet.yc_subnet :
    {
      subnet_id = s.id, zone = s.zone
    }
  ]
}