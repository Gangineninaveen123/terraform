resource "aws_route53_record" "www" {
  
  zone_id = var.zone_id
  count = 4 # this is loop related, creating 4 instances
  name    = "${var.instances[count.index]}.${var.domain_name}" # [mongodb.muruga.site], we need, and instance name ll get through varables ex:-
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip] # from output, i ll get the instance name, in zero index, i ll get that ip address
}