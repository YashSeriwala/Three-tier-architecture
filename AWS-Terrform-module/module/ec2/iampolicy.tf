#  Create IAM Role for SSM
resource "aws_iam_role" "yash-ssm-role" {
  name = "yash-ssm-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}
# Attaced SSM Policy to IAM Role
resource "aws_iam_policy_attachment" "ssm_policy_attach" {
  name       = "SSM-Attach"
  roles      = [aws_iam_role.yash-ssm-role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
# Created IAM Instance Profile
resource "aws_iam_instance_profile" "yash-ssm-profile" {
  name = "SSM-Instance-Profile"
  role = aws_iam_role.yash-ssm-role.name
}
