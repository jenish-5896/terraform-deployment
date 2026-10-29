resource "aws_acm_certificate" "alb" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  subject_alternative_names = [
    "www.${var.domain_name}"
  ]

  key_algorithm = "RSA_2048"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "alb-certificate"
  }
}

resource "aws_acm_certificate_validation" "alb" {
  certificate_arn = aws_acm_certificate.alb.arn

  validation_record_fqdns = [
    for dvo in aws_acm_certificate.alb.domain_validation_options :
    dvo.resource_record_name
  ]
}

output "alb_acm_dns_validation_records" {
  value = {
    for dvo in aws_acm_certificate.alb.domain_validation_options :
    dvo.domain_name => {
      name  = dvo.resource_record_name
      type  = dvo.resource_record_type
      value = dvo.resource_record_value
    }
  }
}



