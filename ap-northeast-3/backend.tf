terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "s3-tripla-terraform-dafa"
    key            = "ap-northeast-1/terraform.tfstate"
    region         = "ap-southeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}