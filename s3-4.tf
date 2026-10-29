resource "aws_s3_bucket" "app" {
  bucket = "jen-bucket-123456"

  tags = {
    Name = "jen-bucket-123456"
  }
}


###########Block public access##############
resource "aws_s3_bucket_public_access_block" "app" {
  bucket = aws_s3_bucket.app.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

