region           = "ap-south-1"
instance_tenancy = "default"
cidr_block       = "10.0.0.0/24"
# availability_zones ={
#     az1 = {
#         availability_zone = "us-east-1a"
#         public_subnet = "10.0.0.0/28"
#         private_subnet = "10.0.0.48/28"
#     },  
# }
public_subnet_cidr          = ["10.0.0.0/28", "10.0.0.16/28", "10.0.0.32/28"]
private_cidr_block          = ["10.0.0.48/28", "10.0.0.64/28", "10.0.0.80/28"]
ami                         = "ami-0d682f26195e9ec0f"
instance_type               = "t2.micro"
availability_zone           = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
associate_public_ip_address = false
instance                    = 2
# aws_security_group = data.aws_security_group.default.id
# subnet_id = module.vpc.private_subnet_id[0].id


internal           = false
load_balancer_type = "application"
name               = "terraform-lb"



allocated_storage    = 10
db_name              = "Terraform-DB"
engine               = "mysql"
engine_version       = "8.0"
instance_class       = "db.t3.micro"
username             = "admin"
password             = "VirtueCloud"
parameter_group_name = "default.mysql8.0"
skip_final_snapshot  = true
#   db_subnet_group_name = aws_db_subnet_group.terraform-sg.name
multi_az = false