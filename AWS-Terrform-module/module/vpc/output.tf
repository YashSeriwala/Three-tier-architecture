# output "public_subnet" {
#   value = module.vpc.public_subnet_id
# }

output "public_subnet_id" {
  value = aws_subnet.public_subnet[0]
}
output "public_subnet_id_1" {
  value = aws_subnet.public_subnet[1]
}

# output "subnet_id1"{
#   value = aws_subnet.private_subnet.id
# }

output "vpc_id" {
  value = aws_vpc.module_vpc.id
}

output "private_subnet_id"{
  value = aws_subnet.private_subnet
}