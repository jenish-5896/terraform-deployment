resource "aws_autoscaling_group" "app" {
  name = "app-asg"

  min_size         = 1
  max_size         = 2
  desired_capacity = 1

  # Private subnet
  vpc_zone_identifier = [
    aws_subnet.private.id
  ]

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  health_check_type = "ELB"

  target_group_arns = [
    aws_lb_target_group.app.arn
  ]

  tag {
    key                 = "Name"
    value               = "app-server"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 50
      skip_matching          = true
    }
  }
}



