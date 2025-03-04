# data "aws_nat_gateway" "default" {
#   subnet_id = aws_subnet.public_subnet.id
# }

# data "aws_eip" "default" {
#   allocation_id = "eipalloc-02191f2e7896851e6"
# }


# data "aws_availability_zones" "example" {
#   all_availability_zones = true

#   filter {
#     name   = "opt-in-status"
#     values = ["not-opted-in", "opted-in"]
#   }
# }

# data "aws_availability_zones" "available" {
#   # state = "available"

# }
