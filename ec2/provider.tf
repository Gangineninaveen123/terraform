#AWS Provider in terraform, -> give in google like this
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.18.0" #
    }
  }
}

provider "aws" {
  # Configuration options
}