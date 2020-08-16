# provider block for aws cloud #
provider "aws" {
  region     = "eu-west-2"
  access_key = "provide-ur-access-key"
  secret_key = "provide-ur-secret-key"
}

# resource block for ec2  #
resource "aws_instance" "myec2" {
   ami = "provide-ur-ami-id"
   instance_type = "t2.micro"
}
# resource block for eip #
resource "aws_eip" "myeip" {
  vpc      = true
}

# resource block for ec2 and eip association #
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.myeip.id
}

resource "aws_security_group" "allow_tls" {
  name        = "my-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]

#    cidr_blocks = [aws_eip.lb.public_ip/32]
  }
}
