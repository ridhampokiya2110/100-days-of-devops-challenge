terraform {
  backend "s3" {
    bucket         = "terraform-day-44"  
    key            = "global/s3/terraform.tfstate"  
    region         = "eu-north-1"                   
    dynamodb_table = "terraform-state-lock"         
    encrypt        = true                           
  }
}

