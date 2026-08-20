terraform {
  backend "s3" {
    bucket = "anushka-terraform-state-bucket123"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}