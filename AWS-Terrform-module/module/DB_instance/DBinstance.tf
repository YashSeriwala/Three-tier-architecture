resource "aws_db_instance" "default" {
  db_name = var.db_name
  engine = var.engine
  engine_version = var.engine_version
  instance_class = var.instance_class
  username = var.username
  password = var.password
  skip_final_snapshot = var.skip_final_snapshot
  parameter_group_name = var.parameter_group_name
  multi_az = var.multi_az
  allocated_storage = var.allocated_storage
  vpc_security_group_ids = [aws_security_group.rds-sg.id] 
  tags = {
    Name = "Terraform RDS"
  }
}

resource "aws_db_subnet_group" "terraform-sg" {
  name       = "main"
  subnet_ids = [var.public_subnet_id.id, var.public_subnet_id_1.id]

  tags = {
    Name = "My DB subnet group"
  }
}



