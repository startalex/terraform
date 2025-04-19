
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}
# This file is used to bootstrap the S3 bucket and DynamoDB table for Terraform state management.
# It is not intended to be used for deploying infrastructure.
# The S3 bucket and DynamoDB table are used to store the Terraform state file and manage state locking.
# The S3 bucket is configured with versioning and server-side encryption.
# The DynamoDB table is configured with on-demand billing mode and a hash key for state locking.
# The S3 bucket and DynamoDB table are created in the eu-central-1 region.
# The S3 bucket name and DynamoDB table name should be unique across all AWS accounts.


provider "aws" {
  region  = "eu-central-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket        = "ammar-terraform-state-7490" # REPLACE WITH YOUR BUCKET NAME
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_bucket_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_crypto_conf" {
  bucket        = aws_s3_bucket.terraform_state.bucket 
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}