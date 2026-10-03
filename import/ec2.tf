resource "aws_instance" "openvpn" {
    ami = "ami-04210df84866a6f22"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-0d8d7189bee7912bc"]
    tags = {
        Name = "openvpn"
    }
    

}