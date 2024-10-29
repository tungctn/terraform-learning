# provider "aws" {
#     region = "ap-southeast-1"
#     alias = "singapore"
# }

# provider "aws" {
#     region = "us-west-1"
#     alias = "california"
# }

# resource "aws" "web_instance" {
#     provider = aws.singapore
#     ami = "ami-04b6019d38ea93034"
#     instance_type = "t2.micro"
#     tags = {
#         Name = "Server Singapore"
#     }
# }