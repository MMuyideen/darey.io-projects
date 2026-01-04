provider "aws" {
  region = var.region
}

module "vpc" {
  source       = "./modules/vpc"
  name         = var.vpc_name
  cidr         = var.vpc_cidr
  tags         = var.common_tags
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
}