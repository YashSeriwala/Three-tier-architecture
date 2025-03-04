# data "aws_availability_zones" "example" {
#   all_availability_zones = true

#   filter {
#     name   = "opt-in-status"
#     values = ["not-opted-in", "opted-in"]
#   }
# }