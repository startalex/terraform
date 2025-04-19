provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-03250b0e01c28d196"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServer"
  }
}