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
<<<<<<< HEAD
  region  = "eu-central-1"
}

resource "aws_instance" "terraform_app_server" {
=======
  region = "eu-central-1"
}

resource "aws_instance" "app_server" {
>>>>>>> 19c9b5e (adding .gitignore file)
  ami           = "ami-03250b0e01c28d196"
  instance_type = "t2.micro"

  tags = {
<<<<<<< HEAD
    Name = "test-terraform_app_server"
  }
}

=======
    Name = "terraform-app-server"
  }
}
>>>>>>> 19c9b5e (adding .gitignore file)
