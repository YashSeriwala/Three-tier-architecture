# data "aws_security_groups" "default_sg" {

#   filter {
#     name   = "group-name"
#     values = ["default"]
#   }
# }

# output "sg_id" {
#   value = data.aws_security_groups.default_sg.id
# }

data "aws_iam_role" "ssm" {
  name = "test-role"

}
# output "ssm" {
#   value = data.aws_iam_role.ssm
# }

