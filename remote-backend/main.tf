resource "aws_ecr_repository" "remote_backend_demo" {
  name = "lab10-remote-backend-demo"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name      = "lab10-remote-backend-demo"
    ManagedBy = "Terraform"
    Lab       = "Lab10"
  }
}