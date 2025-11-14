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
    type = map(string) # our wish
    #tag always, need to be in map, where it may be the Name or any thing
    default = {
        Name = "allow_all"
    }
}

variable "environment"{
    default = "dev"
}

# # Valirales in list format for count loop in terraform
# variable "instances"{
#     default = ["mongodb", "redis", "mysql", "rabbitmq"]
# }

# Valirales in map or set format for , for_each -> its written in ec2.tf in terraform
variable "instances"{
/*     default = {
        # here each keyword is assigned for every iteration, so you will get each.key and each.value
        mongodb = "t3.micro"
        redis = "t3.micro"
        mysql = "t3.small" # it takes more resoures so, t3.small
        rabbitmq = "t3.micro"
    } */
    # here, for_each loop, this list ll be converted to set in ec2.tf, see there more clarity
    default = ["mongodb", "redis", "mysql", "rabbitmq"]
}

variable "zone_id"{
    default = "Z0446603M577BRUXUXUJ"
}

variable "domain_name" {
    default = "muruga.site"
}