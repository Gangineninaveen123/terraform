#AWS Provider in terraform, -> give in google like this
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.18.0" #
    }
  }

  backend "s3" {   # here backend menas -> state or state file, we can consider , for better understanding
    bucket = "secure-state-test-terraform" # created bucket name or folder name, we can consider
    key    = "secure-state" # our wish , actual state file
    region = "us-east-1"
    #dynamodb_table = "remote-state-file-karthikeya" # this is no use now, as we are doing locking in native in s3 buckets only, by [encrypt        = true and use_lockfile   = true]
    encrypt        = true
    use_lockfile   = true # Enable S3 native state locking
}

}

provider "aws" {
  # Configuration options
}