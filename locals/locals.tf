# locals terraform [type this ] syntax ll get from google 
# block name is locals
locals {
    final_name = "${var.project}-${var.environment}-${var.component}"
    ec2_tags = merge(
        var.common_tags,
        {
            environment = "dev"
            version = "1.0"
        }
    )
}