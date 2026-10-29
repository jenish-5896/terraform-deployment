resource "aws_cloudfront_distribution" "app" {
  enabled = true

  comment = "CloudFront for private S3 application"

  price_class = "PriceClass_200"

  web_acl_id = aws_wafv2_web_acl.cloudfront.arn

  aliases = [
    var.domain_name,
    "www.${var.domain_name}"
  ]

  # S3 Origin
  origin {
    domain_name              = aws_s3_bucket.app.bucket_regional_domain_name
    origin_id                = "s3-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.s3.id
  }

  default_cache_behavior {
    target_origin_id       = "s3-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = [
      "GET",
      "HEAD"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  default_root_object = "index.html"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cloudfront.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  depends_on = [
    aws_acm_certificate_validation.cloudfront
  ]

  tags = {
    Name = "app-cloudfront"
  }
}

