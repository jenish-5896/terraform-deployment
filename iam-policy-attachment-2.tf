resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.app.name
  policy_arn = aws_iam_policy.cloudwatch.arn
}

resource "aws_iam_role_policy_attachment" "s3" {
  role       = aws_iam_role.app.name
  policy_arn = aws_iam_policy.s3.arn
}

