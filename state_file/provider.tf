# this is the terraform provider, which is which give the info to .provider plugin in terraform, to connect to cloud systems, for ex: AWS

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.18.0" #
    }
  }

# here, we store our state file of terraform in S3 Buckets in aws
# In Terraform, here backend is nothing but state., where we are telling like save the remote_state_file in s3 bucket in aws, and locking is done by the dynamodb_table = "remote-state-file-karthikeya", and key should be stored as, same name given below [key    = "remote-state-demo" ], lets do and see in s3 buckets and dynamodb

# right now, we are not using the dynamo db, as we are locing the state file in s3 native only, by adding [encrypt        = true, and use_lockfile   = true # Enable S3 native state locking], its simple, no need to dynamodb table creation.
  backend "s3" {   # here backend menas -> state or state file, we can consider , for better understanding
    bucket = "remote-state-files-terraform-murruga" # created bucket name
    key    = "remote-state-demo" # our wish
    region = "us-east-1"
    dynamodb_table = "remote-state-file-karthikeya" # this is no use now, as we are doing locking in native in s3 buckets only, by [encrypt        = true and use_lockfile   = true]
    encrypt        = true
    use_lockfile   = true # Enable S3 native state locking
}
}

provider "aws" {
  # Configuration options
}