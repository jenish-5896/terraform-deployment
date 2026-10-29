terraform {


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}


# CloudFront ACM must be in us-east-1
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
