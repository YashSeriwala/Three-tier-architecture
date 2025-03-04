resource "aws_lb" "terraform-lb" {
  name = var.name
  internal = var.internal
  load_balancer_type = var.load_balancer_type
  subnets = var.subnets
  
#   if we want to take subnet using for loop then we use this subnets line 
#   subnets = [ for subnet in aws_subnet.public_subnet : subnet.id ]
}

resource "aws_alb_target_group" "demo" {
  name = "demo1"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}


resource "aws_alb_target_group_attachment" "demo" {
  target_group_arn = aws_alb_target_group.demo.arn
  target_id = var.target_id
  port = 80
}

resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.terraform-lb.arn
  port              = 80
  protocol         = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.demo.id
}
}
