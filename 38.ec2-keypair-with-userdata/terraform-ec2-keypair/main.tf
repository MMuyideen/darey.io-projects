provider "aws" {
  region = "us-west-2"  # Change this to your AWS Account region
}

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

resource "aws_key_pair" "example_keypair" {
  key_name   = "example-keypair"
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}

resource "aws_instance" "example_instance" {
  ami           = data.aws_ami.ubuntu.id  # Specify your desired AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example_keypair.key_name

  vpc_security_group_ids = ["sg-009a71dd6620040ea"]  # Specify your security group ID

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
              sudo systemctl restart apache2
              EOF
}

output "public_ip" {
  value = aws_instance.example_instance.public_ip
}
