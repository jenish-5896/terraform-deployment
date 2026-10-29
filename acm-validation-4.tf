resource "aws_acm_certificate_validation" "cloudfront" {
  provider = aws.us_east_1

  certificate_arn = aws_acm_certificate.cloudfront.arn

  validation_record_fqdns = [
    for dvo in aws_acm_certificate.cloudfront.domain_validation_options :
    dvo.resource_record_name
  ]
}


output "acm_dns_validation_records" {
  value = {
    for dvo in aws_acm_certificate.cloudfront.domain_validation_options :
    dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }
}

