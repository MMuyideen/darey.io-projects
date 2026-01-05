provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

module "ecr" {
  source          = "./modules/ecr"
  repository_name = "darey-tf-ecr-repo"
}

module "ecs" {
  source             = "./modules/ecs"
  ecr_repository_url = module.ecr.repository_url
  app_name           = "darey-web-app"
}