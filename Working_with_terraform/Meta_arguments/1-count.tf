# resource "aws_instance" "web" {
#   count         = 2
#   ami           = "ami-03fa85deedfcac80b"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "Server ${count.index + 1}"
#   }
# }