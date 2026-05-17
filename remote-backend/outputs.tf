output "ecr_repository_url" {
  value       = aws_ecr_repository.remote_backend_demo.repository_url
  description = "URL of the ECR repository"
}