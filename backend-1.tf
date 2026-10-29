terraform {

  backend "s3" {
    bucket       = "test-jen-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = "true"
    encrypt      = true
  }

}
