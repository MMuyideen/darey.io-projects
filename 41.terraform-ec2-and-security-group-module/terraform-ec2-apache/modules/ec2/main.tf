variable "security_group_id" {}
variable "user_data" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.ubuntu.id  # Specify your desired AMI ID
  instance_type          = "t2.micro"
  vpc_security_group_ids = [var.security_group_id]
  user_data              = var.user_data

  tags = {
    Name = "Apache-Web-Server"
  }
}

output "public_ip" {
  value = aws_instance.web_server.public_ip
}