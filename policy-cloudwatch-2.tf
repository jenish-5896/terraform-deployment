resource "aws_iam_policy" "cloudwatch" {
  name        = "app-cloudwatch-policy"
  description = "Allow EC2 to send logs and metrics to CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogStreams"
        ]

        Resource = "*"
      }
    ]
  })
}

