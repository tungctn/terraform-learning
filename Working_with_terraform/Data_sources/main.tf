data "aws_ami" "ubuntu_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu_ami.id
}

# resource "aws_instance" "VM01" {
#   ami           = data.aws_ami.ubuntu_ami.id
#   instance_type = "t2.micro"
#   tags = {
#     Name = "VM01"
#   }
# }

data "aws_instance" "find_instance" {
    filter {
      name  = "tag:Name"
      values = ["VM01"]
    }
}

output "Ubuntu-public-ip" {
  value = data.aws_instance.find_instance.public_ip
}

resource "aws_instance" "VM02" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = data.aws_instance.find_instance.instance_type
  tags = {
    Name = "VM02"
  }
}