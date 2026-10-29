####to attach role to ec2##############

resource "aws_iam_instance_profile" "app" {
  name = "app-ec2-instance-profile"
  role = aws_iam_role.app.name
}
