resource "aws_instance" "roboshop" {

  # the belows, which is dependent on var, its created in varaibles folder
  ami           = var.ami_id  # left side, its terraform syntax, right side our istam
  # by usung count based loops, we can give how many number of instances can be created
  count = 4
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  # here, in sequrity group, it ll take downside inbound and outbound , id's and creates them.
  vpc_security_group_ids = [ aws_security_group.allow-all.id]

  # tags is the name of the instances

  tags = {
    Name = var.instances[count.index]
  }
}

# sequrity group and inpbound and out bound rules infra creation
resource "aws_security_group" "allow-all" {

    name        = var.sg_name
    description = var.sg_description

    ingress {

        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {

        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = var.sg_tags
}