variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "component" {
    default = "cart"
}

#common_tagts

variable "common_tags" {
    default = {
        Project = "roboshop"
        Terraform = "true"
    }
}

# ec2 name = cart
# ec2 name = roboshop-dev-cart

#interpolation will not work in varables.tf file, so that we can use it in locals file.
# Like this , we can't use i variables, that's y we are using locals., check there more clear information.
/* variable "final_component" {
    default = "${var.project}-${var.environment}-${var.component}"
} */