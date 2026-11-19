terraform {
  required_version = ">= 1.11.0"

  backend "s3" {
    bucket       = "terraform-state-788353521849-eu-north-1"
    key          = "dev/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true
    use_lockfile = true
  }
}
