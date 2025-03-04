resource "aws_instance" "ec2_module" {
  instance_type = var.instance_type
  ami           = var.ami
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  # security_groups = data.aws_security_groups.default_sg.ids
  # availability_zone = var.availability_zone
  security_groups = [aws_security_group.test_sg.id]
  iam_instance_profile = aws_iam_instance_profile.yash-ssm-profile.name


  user_data = <<-EOF
              #!/bin/bash
              # Update the system
              yum update -y
              # Enable the nginx extras repository
              amazon-linux-extras enable nginx1
              # Install NGINX
              yum install -y nginx
              # Start NGINX service
              systemctl start nginx
              # Enable NGINX to start on boot
              systemctl enable nginx
              EOF


  tags = {
    Name = "instance using module"
  }

}