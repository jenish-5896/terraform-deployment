resource "aws_launch_template" "app" {
  name_prefix   = "app-server-"
  image_id      = "ami-0ba4172b23e57d5a8"
  instance_type = "t3.micro"

  #####attaching instance profile(role) to ec2##########
  iam_instance_profile {
    name = aws_iam_instance_profile.app.name
  }

  vpc_security_group_ids = [
    aws_security_group.app.id
  ]

  #####userdata###########

  user_data = filebase64("${path.module}/userdata.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "app-server"
    }
  }
}

