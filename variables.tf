variable "name" {
  description = "Yandex network name"
  type        = string
}

variable "subnets" {
  description = "Subnet with zone like ru-cetral1a and cidr like [10.0.0.0/24]"
  type = map(object({
    zone = string
    cidr = string
  }))
}

variable "labels" {
  description = "Labels for network and/or subnet resources"
  type        = map(string)
  default     = {}
}