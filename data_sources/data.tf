# Data Source: aws_ami  terraform ,type in goolgle 

data "aws_ami" "joindevops" {
    owners           = ["973714476881"]
    most_recent      = true # always if any updates latest, we ll take tastest , so its true

    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
  }
    filter {

        name   = "root-device-type"
        values = ["ebs"]
  }

    filter {

        name   = "virtualization-type"
        values = ["hvm"]
  }    

    
  
}

# output block reference in terraform
output "ami_id" {
    value = data.aws_ami.joindevops.id  # I ll get all the detalils of ami, which it queries and shows to us, when doing -> terraform plan
}