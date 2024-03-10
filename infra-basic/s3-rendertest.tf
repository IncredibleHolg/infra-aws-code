####
# rendertest
resource "aws_s3_bucket" "s3_rendertest" {
  bucket = format("%s-%s",var.s3_rendertest,var.accountnumber)

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}
# resource "aws_s3_bucket_acl" "s3_rendertest" {
#   bucket = aws_s3_bucket.s3_rendertest.id
#   acl    = "private"
# }
resource "aws_s3_bucket_versioning" "s3_rendertest" {
  bucket = aws_s3_bucket.s3_rendertest.id
  versioning_configuration {
    status = "Disabled"
  }
}
resource "aws_s3_bucket_website_configuration" "s3_rendertest" {
  bucket = aws_s3_bucket.s3_rendertest.id

  index_document {
    suffix = "index.html"
  }
 }
# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_rendertest" {
  bucket = aws_s3_bucket.s3_rendertest.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
