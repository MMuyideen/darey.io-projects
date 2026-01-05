variable "repository_name" {
  description = "darey-tf-ecr-repo"
  type        = string
}

resource "aws_ecr_repository" "app_repo" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"
  force_delete         = true # Allows destroying repo even if it contains images

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "repository_url" {
  value       = aws_ecr_repository.app_repo.repository_url
  description = "The URL of the ECR repository"
}