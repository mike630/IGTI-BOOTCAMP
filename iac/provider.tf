terraform {
  backend "s3" {
    bucket = "terraform-state-mcn630"
    key    = "/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = var.aws_region
}