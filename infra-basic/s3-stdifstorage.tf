####
# haulaway
resource "aws_s3_bucket" "s3_stdifstorage" {
  bucket = format("%s-%s",var.s3_stdifstorage,var.accountnumber)

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}
resource "aws_s3_bucket_acl" "s3_stdifstorage" {
  bucket = aws_s3_bucket.s3_stdifstorage.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "s3_stdifstorage" {
  bucket = aws_s3_bucket.s3_stdifstorage.id
  versioning_configuration {
    status = "Disabled"
  }
}
resource "aws_s3_bucket_website_configuration" "s3_stdifstorage" {
  bucket = aws_s3_bucket.s3_stdifstorage.id

  index_document {
    suffix = "index.html"
  }
 }

# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_stdifstorage" {
  bucket = aws_s3_bucket.s3_stdifstorage.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
