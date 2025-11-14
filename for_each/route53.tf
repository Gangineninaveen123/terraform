resource "aws_route53_record" "www" {
  
  zone_id = var.zone_id
  for_each = aws_instance.roboshop
  name    = "${each.key}.${var.domain_name}" # [mongodb.muruga.site], we need, and instance name ll get through varables ex:-
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip] # from output, i ll get the each.value, so from here, i ll get private ip address
}