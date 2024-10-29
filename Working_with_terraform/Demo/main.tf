terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.71.0"
    }
  }
}

provider "aws" {
    region = "ap-southeast-1"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "web" {
  ami           = "ami-03fa85deedfcac80b"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}