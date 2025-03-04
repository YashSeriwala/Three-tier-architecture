variable "region" {

}

variable "cidr_block" {
  type = string
}

variable "instance_tenancy" {
  type = string
}

variable "public_subnet_cidr" {
  type = list(string)
}

variable "private_cidr_block" {
  type    = list(string)
  default = []
}

variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "availability_zone" {
  type = list(string)
}

variable "associate_public_ip_address" {
  type = bool
}

variable "instance" {

}
# variable "availability_zones" {
#   type = map(any)
# }

# variable "aws_security_group" {
#   type = string
# }

# variable "vpc_id" {

# }
# variable "subnet_id" {

# }



variable "load_balancer_type" {
  type = string
}

variable "internal" {
  type = bool
}
variable "name" {
  type = string
}
# variable "subnets" {

# }

# variable "vpc_id" {

# }




# variable "public_subnet_id" {

# }
# variable "public_subnet_id_1" {

# }

variable "allocated_storage" {

}
variable "db_name" {

}

variable "engine" {

}

variable "engine_version" {

}
variable "instance_class" {

}
variable "username" {

}
variable "password" {

}
variable "parameter_group_name" {

}
variable "skip_final_snapshot" {

}
variable "multi_az" {

}
# variable "security_g" {

# }