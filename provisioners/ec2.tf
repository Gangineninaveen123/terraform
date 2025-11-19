resource "aws_instance" "roboshop" {
  # the belows, which is dependent on var, its created in varaibles folder
  ami           = var.ami_id  # left side, its terraform syntax, right side our istam
  instance_type = var.instance_type
  # here, in sequrity group, it ll take downside inbound and outbound , id's and creates them.
  vpc_security_group_ids = [ aws_security_group.allow-all.id]

  # after creating instance, this command ll run [***local-exec****]
  # we can write, n number of provisoners, one after one, for which, commands we want , or if we need
  provisioner "local-exec" {
    command = "${self.private_ip} > inventory"
    on_failure = continue # if we want to continue even after failure, we use this command, [search on failure in provisioner in google for terraform]
    
  }
# when we want to run the provisioner at run time also, then we ll, give [when    = destroy]
  provisioner "local-exec" {
    command = "echo 'instance is destroyed'"
    when    = destroy #ignoring errors
  }

# it  is remote-exec [provisoner], after creating server, ll connect to it, with the help of connection

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip # from laptop, we are connecting to server, its public ip
  }

#now what to do, after connecting to server with public ip adress with [remote-exec]
# note -> its in creation time
  provisioner "remote-exec" {
    inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
      
    ]
  }

  # at destroy time
  provisioner "remote-exec" {
    # always remember before destoring any server, we ned to stop the services, if we are not stooping means, users ll get get different type of errors....
    when = destroy
    inline = [
        "sudo systemctl stop nginx",
      
      
    ]
  }



  tags = var.ec2_tags
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