# output "sg_id" {
#   value = data.aws_security_group.default.id
# }

# output "sg_id" {
#   value = aws_security_group.test_sg.id
# }

# output "test" {
#   value = aws_iam_policy.ssm_policy.arn
# }

output "instance_name" {
  value = aws_instance.ec2_module
}