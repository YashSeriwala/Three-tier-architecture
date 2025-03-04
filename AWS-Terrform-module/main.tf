module "vpc" {
  source             = "./module/vpc"
  instance_tenancy   = var.instance_tenancy
  cidr_block         = var.cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_cidr_block = var.private_cidr_block
  availability_zone  = var.availability_zone
  internal           = var.internal
  load_balancer_type = var.load_balancer_type

}

# # module "vpc" {
# #   source             = "./module/vpc"
# #   for_each = var.availability_zones
# #   instance_tenancy   = var.instance_tenancy
# #   cidr_block         = var.cidr_block
# #   public_subnet_cidr =  each.value.public_subnet
# #   private_cidr_block = each.value.private_subnet
# #   availability_zone = each.value.availability_zone
# # }

# module "ec2_module" {
#   source                      = "./module/ec2"
#   ami                         = var.ami
#   instance_type               = var.instance_type
#   subnet_id                   = module.vpc.private_subnet_id[0].id
#   associate_public_ip_address = var.associate_public_ip_address
#   vpc_id                      = module.vpc.vpc_id
#   # availability_zone           = var.availability_zone[0]
#   # iam_policy = aws_iam_policy.ssm
#   # iam_role = data.aws_iam_policy.ssm
# }

# module "lb" {
#   source             = "./module/load_balancer"
#   count              = 2
#   name               = var.name
#   internal           = var.internal
#   load_balancer_type = var.load_balancer_type
#   subnets            = [module.vpc.public_subnet_id.id, module.vpc.public_subnet_id_1.id]
#   vpc_id             = module.vpc.vpc_id
#   target_id          = module.ec2_module.instance_name.id
# }



module "Database" {
  source               = "./module/DB_instance"
  vpc_id               = module.vpc.vpc_id
  db_name              = var.db_name
  public_subnet_id     = module.vpc.public_subnet_id
  public_subnet_id_1   = module.vpc.public_subnet_id_1
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  skip_final_snapshot  = var.skip_final_snapshot
  parameter_group_name = var.parameter_group_name
  multi_az             = var.multi_az
  allocated_storage    = var.allocated_storage
}
