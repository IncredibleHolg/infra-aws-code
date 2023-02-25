
# shared S3 Buckets
data "aws_canonical_user_id" "current" {}
locals{
  canonicaluser = "6f6e1c390e2dfc92dc997ffbe98533a7aa6e84426aab9b1cf2fb2bf5af51f8cf"
}


resource "aws_s3_bucket" "s3_server_backups" {
  bucket = format("%s-%s",var.mcserverbackups,var.accountnumber)
  acl    = "private"

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}

resource "aws_s3_bucket" "s3_bucket_logs" {
  bucket = format("%s-%s",var.logs_bucket_name,var.accountnumber)
  acl    = "private"
  versioning {
    enabled = true
  }

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}

resource "aws_s3_bucket" "s3_vanilla18" {
  bucket = format("%s-%s",var.s3_vanilla18,var.accountnumber)
  acl    = "private"
  versioning {
    enabled = false
  }
  # website {
  #   index_document = "index.html"
  # }

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}

# aws s3 sync --delete  map s3://vanilla18-433352544266/



resource "aws_s3_bucket" "s3_mc_resources" {
  bucket = format("%s-%s",var.s3_mc_resources,var.accountnumber)
  acl    = "private"
  versioning {
    enabled = true
  }
  website {
    index_document = "index.html"
  }

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}

####
# haulaway
resource "aws_s3_bucket" "s3_haulaway" {
  bucket = format("%s-%s",var.s3_haulaway,var.accountnumber)
  acl    = "private"
  versioning {
    enabled = false
  }
  website {
    index_document = "index.html"
  }

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}
