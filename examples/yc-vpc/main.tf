locals {
  name = "sample-vpc"

  labels = {
    Owner       = "whoami"
    environment = "staging"
  }
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../../"

  name   = local.name
  labels = local.labels

  subnets = {
    // Public subnets with public IP addresses.
    public-ru-central1-a = { zone = "ru-central1-a", cidr = "10.0.0.0/20" },
    public-ru-central1-b = { zone = "ru-central1-b", cidr = "10.0.16.0/20" },
    public-ru-central1-c = { zone = "ru-central1-c", cidr = "10.0.32.0/20" },

    // Private subnets have Internet access through NAT.
    private-a-ru-central1-a = { zone = "ru-central1-a", cidr = "10.0.48.0/20" },
    private-a-ru-central1-b = { zone = "ru-central1-b", cidr = "10.0.64.0/20" },
    private-a-ru-central1-c = { zone = "ru-central1-c", cidr = "10.0.80.0/20" },

    // Private subnets without Internet access.
    private-b-ru-central1-a = { zone = "ru-central1-a", cidr = "10.0.96.0/20" },
    private-b-ru-central1-b = { zone = "ru-central1-b", cidr = "10.0.112.0/20" },
    private-b-ru-central1-c = { zone = "ru-central1-c", cidr = "10.0.128.0/20" },
  }
}