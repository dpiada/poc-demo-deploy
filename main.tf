terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.47.0"
    }
  }

  backend "http" {
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.deploy_tags
  }
}
