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

resource "aws_instance" "my_ec2_spec" {
  ami           = data.aws_ami.ubuntu.id  # Specify your desired AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-created-EC2-Instance"
  }
}

resource "aws_ami_from_instance" "my_ec2_spec_ami" {
  name                 = "my-ec2-ami"
  description          = "My AMI created from my EC2 Instance with Terraform script"
  source_instance_id   = aws_instance.my_ec2_spec.id
}
