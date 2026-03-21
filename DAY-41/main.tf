# 1. Terraform ko batao ki hum AWS use kar rahe hain
provider "aws" {
  region = "ap-south-1"
}

# 2. Ek S3 bucket banane ka code
resource "aws_s3_bucket" "my_first_tf_bucket" {
  bucket = "ridham-terraform-bucket-day41" # Yahan kuch unique naam dalo
  
  tags = {
    Name        = "My Terraform Bucket"
    Environment = "Dev"
  }
}