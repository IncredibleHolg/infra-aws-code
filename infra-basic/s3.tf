
# shared S3 Buckets
data "aws_canonical_user_id" "current" {}
locals{
  canonicaluser = "6f6e1c390e2dfc92dc997ffbe98533a7aa6e84426aab9b1cf2fb2bf5af51f8cf"
}

# module "s3_bucket_logs" {
#   source = "terraform-aws-modules/s3-bucket/aws"
#   version = "2.11.1"
#   bucket = format("%s-%s",var.logs_bucket_name,var.accountnumber)
#   tags = {
#     project =  "infra-basic"
#   }
#   acl    = null # conflicts with default of `acl = "private"` so set to null to use grants
#   grant = [
#     {
#       id = data.aws_canonical_user_id.current.id
#       type = "CanonicalUser"
#       permissions = [ "FULL_CONTROL" ]
#     },
#     {
#       id = local.canonicaluser
#       type = "CanonicalUser"
#       permissions = [ "FULL_CONTROL" ]
#     },
#   ]

#   versioning = {
#     enabled = true
#   }
# }

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
  website {
    index_document = "index.html"
  }

  tags = {
    project = var.project_name
    "installer"   = "hdunkel"
    "installtype" = "terraform"
  }
}

# aws s3 sync --delete  map s3://vanilla18-433352544266/
