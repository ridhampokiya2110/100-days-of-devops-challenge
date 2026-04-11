provider "aws" {
  region = "eu-north-1"
}

# The Magic Import Block
import {
  id = "manual-bucket-day53-ridham"  
  to = aws_s3_bucket.adopted_bucket     
}