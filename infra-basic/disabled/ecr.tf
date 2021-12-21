resource "aws_ecr_repository" "ecr-dd" {
  name = "dd-repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
