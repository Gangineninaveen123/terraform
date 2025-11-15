output "final_name" {
    value = local.final_name # while reffereing we ll use [local, not locals] from locals.tf
}

output "ec2_tags" {
    value = local.ec2_tags
}