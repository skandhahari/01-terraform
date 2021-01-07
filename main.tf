
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  # VERSION IS NOT NEEDED HERE
}

resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-jaig-004"
    versioning {
      enabled = true
    }
}

resource "aws_iam_user" "my_iam_user"{
    name="my_iam_user_abc_updated"
}

output "my_s3_bucket_versioning" {
  value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}


output "my_s3_bucket_complete_details" {
  value = aws_s3_bucket.my_s3_bucket
}

output "my_iam_user_complete_details" {
  value = aws_iam_user.my_iam_user
}
