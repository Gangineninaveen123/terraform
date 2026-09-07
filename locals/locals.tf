# locals terraform [type this ] syntax ll get from google 
# block name is locals

# this variables, we can't override inside the locals.[variables can be overriden, where as locan's be ovveridden.]
locals {
    final_name = "${var.project}-${var.environment}-${var.component}" # roboshop-dev-cart  #[interpollation]
    ec2_tags = merge(
        var.common_tags,
        {
            environment = "dev"
            version = "1.0"
        }
    )
}