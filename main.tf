terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-central-1"
}

resource "aws_instance" "terraform_app_server" {
  ami           = "ami-03250b0e01c28d196"
  instance_type = "t2.micro"

  tags = {
    Name = "test-terraform_app_server"
  }
}

