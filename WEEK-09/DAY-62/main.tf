provider "aws" {
  region = "eu-north-1"
}

# ==========================================
# 1. THE 'COUNT' LOOP (Basic Automation)
# ==========================================
# Goal: Create 3 identical S3 buckets for 3 different environments

resource "aws_s3_bucket" "env_buckets" {
  count  = 3 # Ye block 3 baar chalega (0, 1, 2)
  
  # count.index dynamically 0, 1, 2 print karega
  bucket = "day62-app-bucket-apnanaam-${count.index}" 
  
  tags = {
    Name = "Environment Bucket ${count.index}"
  }
}

# ==========================================
# 2. THE 'FOR_EACH' LOOP (Senior Automation)
# ==========================================
# Goal: Create IAM Users from a specific list of names

variable "new_hires" {
  description = "List of new employees"
  type        = set(string) # for_each hamesha set ya map par chalta hai
  default     = ["Aman", "Priya", "Rahul", "Neha"]
}

resource "aws_iam_user" "team_users" {
  for_each = var.new_hires # Ye loop list ke har naam par chalega
  
  # each.value dynamically list se current naam uthayega
  name     = "Day62-Dev-${each.value}" 
  
  tags = {
    Role = "Developer"
  }
}

# OUTPUT TO SEE THE MAGIC
output "created_iam_users" {
  # Ek loop output mein bhi laga sakte hain sabke naam print karne ke liye!
  value = [for user in aws_iam_user.team_users : user.name]
}