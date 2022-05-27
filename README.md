## Terraform module which creates VPC resources on Yandex Cloud

[![Actions Status](https://github.com/telematiquedev/terraform-yandex-vpc/workflows/Validate%20terraform/badge.svg)](https://github.com/telematiquedev/terraform-yandex-vpc/actions)

## Usage

```tf
locals {
  name = "sample_vpc"

  labels = {
    Owner       = "whoami"
    Environment = "staging"
  }
}

module "vpc" {
  source  = "git@github.com:telematiquedev/terraform-yandex-vpc?ref=v1.0.0"

  name    = local.name
  labels  = local.labels

  subnets = {
    private-ru-central1-a  = { zone = "ru-central1-a", cidr = "10.0.0.0/20" }
  }
}
```

## Examples

[Main sample](https://github.com/telematiquedev/terraform-yandex-vpc/tree/main/examples/yc-vpc)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| yandex | ~> 0.72 |

## Providers

| Name | Version |
|------|---------|
| yandex | ~> 0.72 |

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | Resource |
| [yandex_vpc_subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | Resource |

## Inputs

| Name | Description |
|------|-------------|
| name | Network name |
| labels | Additional labels for the network and subnets |
| subnets | object with ZONE and CIDR |

## Outputs

| Name | Description |
|------|-------------|
| network_id | The ID of the VPC |
| subnets_locations | Map subnet id and zone |