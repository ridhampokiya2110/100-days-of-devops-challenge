terraform {
  backend "s3" {
    bucket         = "devops-tf-state-ridham-12345" 
    key            = "day47/terraform.tfstate"       
    region         = "eu-north-1"
    dynamodb_table = "terraform-state-lock"           
  }
}
provider "aws" {
  region = "eu-north-1"
}

# 1. Create S3 Bucket (To store the State File)
resource "aws_s3_bucket" "tf_state" {
  bucket = "devops-tf-state-ridham-12345"                              
}

# 2. Enable Versioning (Taaki purani state files ka backup rahe)
resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 3. Create DynamoDB Table (To Lock the State File)
resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
