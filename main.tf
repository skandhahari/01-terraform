terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "iam_user_name_prefix" {
   default = my_iam_users
  
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  # VERSION IS NOT NEEDED HERE
}

resource "aws_iam_user" "my_iam_users"{
    count = 2
    name="${var.iam_user_name_prefix}_${count.index}"
}