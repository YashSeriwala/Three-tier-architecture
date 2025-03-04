variable "cidr_block" {
  type = string
}

variable "instance_tenancy" {
  type = string
}

variable "public_subnet_cidr" {
  type = list(any)
}

variable "private_cidr_block" {
  type = list(any)
}

variable "availability_zone" {
  type = list(string)
}
variable "load_balancer_type" {
  type = string
}

variable "internal" {
  type = bool
}