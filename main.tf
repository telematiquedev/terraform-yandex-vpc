resource "yandex_vpc_network" "yc_network" {
  name = var.name

  labels = var.labels
}

resource "yandex_vpc_subnet" "yc_subnet" {
  for_each = var.subnets

  network_id     = yandex_vpc_network.yc_network.id
  name           = each.key
  v4_cidr_blocks = [each.value.cidr]
  zone           = each.value.zone

  labels = var.labels
}