variable "region" {
  type    = string
  default = "us-west-2"
}

variable "vpc_name" {
  type    = string
  default = "example-vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "s3_bucket_name" {
  type    = string
  default = ""
}

variable "common_tags" {
  type    = map(string)
  default = {
    Project = "terraform-modules-vpc-s3"
  }
}