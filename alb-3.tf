resource "aws_lb" "app" {
  name               = "app-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = [
    aws_subnet.public.id,
    aws_subnet.public_2.id
  ]


  tags = {
    Name = "app-alb"
  }
}

