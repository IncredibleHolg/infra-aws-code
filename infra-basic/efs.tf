resource "aws_efs_file_system" "minecraftstorage" {

  tags = {
    Name = "minecraftstorage"
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  lifecycle_policy {
    transition_to_primary_storage_class = "AFTER_1_ACCESS"
  }

}
