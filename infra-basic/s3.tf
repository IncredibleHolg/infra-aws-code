
# shared S3 Buckets
data "aws_canonical_user_id" "current" {}
locals{
  canonicaluser = "6f6e1c390e2dfc92dc997ffbe98533a7aa6e84426aab9b1cf2fb2bf5af51f8cf"
}


resource "aws_s3_bucket" "s3_server_backups" {
  bucket = format("%s-%s",var.mcserverbackups,var.accountnumber)

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}
resource "aws_s3_bucket_acl" "s3_server_backups" {
  bucket = aws_s3_bucket.s3_server_backups.id
  acl    = "private"
}

resource "aws_s3_bucket" "s3_bucket_logs" {
  bucket = format("%s-%s",var.logs_bucket_name,var.accountnumber)

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}
resource "aws_s3_bucket_acl" "s3_bucket_logs" {
  bucket = aws_s3_bucket.s3_bucket_logs.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "s3_bucket_logs" {
  bucket = aws_s3_bucket.s3_bucket_logs.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "s3_vanilla18" {
  bucket = format("%s-%s",var.s3_vanilla18,var.accountnumber)

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}
resource "aws_s3_bucket_acl" "s3_vanilla18" {
  bucket = aws_s3_bucket.s3_vanilla18.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "s3_vanilla18" {
  bucket = aws_s3_bucket.s3_vanilla18.id
  versioning_configuration {
    status = "Disabled"
  }
}
# aws s3 sync --delete  map s3://vanilla18-433352544266/



resource "aws_s3_bucket" "s3_mc_resources" {
  bucket = format("%s-%s",var.s3_mc_resources,var.accountnumber)

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}
resource "aws_s3_bucket_acl" "s3_mc_resources" {
  bucket = aws_s3_bucket.s3_mc_resources.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "s3_mc_resources" {
  bucket = aws_s3_bucket.s3_mc_resources.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_website_configuration" "s3_mc_resources" {
  bucket = aws_s3_bucket.s3_mc_resources.id

  index_document {
    suffix = "index.html"
  }
 }

####
# haulaway
resource "aws_s3_bucket" "s3_haulaway" {
  bucket = format("%s-%s",var.s3_haulaway,var.accountnumber)

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}
resource "aws_s3_bucket_acl" "s3_haulaway" {
  bucket = aws_s3_bucket.s3_haulaway.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "s3_haulaway" {
  bucket = aws_s3_bucket.s3_haulaway.id
  versioning_configuration {
    status = "Disabled"
  }
}
resource "aws_s3_bucket_website_configuration" "s3_haulaway" {
  bucket = aws_s3_bucket.s3_haulaway.id

  index_document {
    suffix = "index.html"
  }
 }
