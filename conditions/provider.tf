#this means, aws provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.18.0" #
    }
  }
}

#this means, aws authentication
provider "aws" {
  # Configuration options
}