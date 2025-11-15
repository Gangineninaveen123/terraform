#varaibles in terraform

#ami id
variable "ami_id" {
  type        = string #not mandatory
  default     = "ami-09c813fb71547fc4f"
  description = "ami_id of join devops RHEL9" # not mandatory

}

#instance type for instance creation

variable "instance_type"{
    default = "t3.micro"
}

# ec2 tags -> means , its name of the instance

variable "ec2_tags"{
    # deafult is map and inside map, those are key value pairs
    type = map(string) # optional command our wish
    default = {
        Name = "terraform"
        Purpose = "variables-demo"
    } 
    
}

# sequrity groups in variables

variable "sg_name"{
    default = "allow_all"
}

variable "sg_description"{
    default = " allowing all ports from internet"
}

variable "from_port"{
    default = 0
}

variable "to_port"{
    type = number # optional
    default = 0
}

variable "cidr_blocks"{
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "sg_tags"{
    type = map(string)
    #tag always, need to be in map, where it may be the Name or any thing
    default = {
        Name = "allow_all"
    }
}

variable "environment"{
    default = "dev"
}

variable "instances"{
    default = ["mongodb", "redis", "mysql", "rabbitmq"]
}

variable "zone_id"{
    default = "Z0446603M577BRUXUXUJ"
}

variable "domain_name" {
    default = "muruga.site"
}

#common_tagts

variable "common_tags" {
    default = {
        Project = "roboshop"
        Terraform = "true"
    }
}