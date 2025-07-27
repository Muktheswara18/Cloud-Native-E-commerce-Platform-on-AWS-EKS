# terraform_code/backend.tf
#
# Configures the S3 backend for Terraform state management.
# Ensures state is stored remotely and locked for collaborative development.
#
# Author: Your Name
# Date: July 27, 2025

terraform {
  backend "s3" {
    bucket         = "my-ecommerce-platform-tfstate"
    key            = "terraform/state"
    region         = "eu-central-1"
    dynamodb_table = "my-ecommerce-platform-tflocks"
  }
}