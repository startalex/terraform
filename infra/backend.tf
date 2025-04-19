terraform {
  backend "s3" {
    bucket         = "ammar-terraform-state-7490"
    key            = "infra/main.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }
}