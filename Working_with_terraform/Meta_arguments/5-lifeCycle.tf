resource "aws_security_group" "example_sg" {
  name        = "example_sg"
  description = "Allow HTTP, HTTPS, and SSH Traffic"

  // Allow HTTP (Port 80)
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Allow HTTPS (Port 443)
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Allow SSH (Port 22)
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
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
  count         = 1
  ami           = "ami-04b6019d38ea93034"
  availability_zone = "ap-southeast-1a"
  instance_type = "t2.micro"
  tags = {
    Name = "Server ${count.index + 1}"
  }
  security_groups = [aws_security_group.example_sg]
  lifecycle {
    create_before_destroy = true
    ignore_changes = [ 
        tags,
        instance_type
     ]
  }
}