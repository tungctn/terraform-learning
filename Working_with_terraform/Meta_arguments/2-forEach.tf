# resource "aws_instance" "web" {
#   for_each = {
#     "linux" : "ami-04b6019d38ea93034",
#     "ubuntu" : "ami-03fa85deedfcac80b"
#   }
#   ami           = each.value
#   instance_type = "t2.micro"

#   tags = {
#     Name = "Server ${each.key}"
#   }
# }