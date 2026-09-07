resource "aws_instance" "roboshop" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  # here, in sequrity group, it ll take downside inbound and outbound , id's and creates them.
  vpc_security_group_ids = local.sg_id # while selecting from locals, need to take local while using for solution

  tags = {
    Name = "HelloWorld"
  } 
}

# sequrity group and inpbound and out bound rules infra creation
resource "aws_security_group" "allow-all" {

    name        = "allow_all"
    description = "allow all traffic"

    ingress {

        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {

        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_all"
    }
}