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

/* variable "final_component" {
    default = "${var.project}-${var.environment}-${var.component}"
} */