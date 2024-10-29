locals {
  ami_ids = {
    "linux" : "ami-04b6019d38ea93034",
    "ubuntu" : "ami-03fa85deedfcac80b"
  }
}

resource "aws_security_group" "web_security_group" {
  name        = "web_security_group"
  description = "Allow All Traffic"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  for_each      = local.ami_ids
  ami           = each.value
  instance_type = "t2.micro"
  tags = {
    Name = "Server ${each.key}"
  }
  security_groups = [aws_security_group.web_security_group.name]
  depends_on = [ aws_security_group.web_security_group ]
}

