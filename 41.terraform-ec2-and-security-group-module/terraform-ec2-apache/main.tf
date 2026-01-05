provider "aws" {
  region = "us-west-2"
}

module "security_group" {
  source = "./modules/security_group"
}

module "ec2_instance" {
  source            = "./modules/ec2"
  security_group_id = module.security_group.security_group_id
  user_data         = file("apache_userdata.sh")
}

output "web_server_url" {
  value = "http://${module.ec2_instance.public_ip}"
}