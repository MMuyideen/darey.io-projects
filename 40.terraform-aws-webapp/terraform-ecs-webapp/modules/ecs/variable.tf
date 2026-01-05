variable "ecr_repository_url" {
  description = "The URL of the ECR repository to pull the image from"
  type        = string
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "darey-web-app"
}