
# shared S3 Buckets
data "aws_canonical_user_id" "current" {}

module "s3_bucket_logs" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "2.11.1"
  bucket = format("%s-%s",var.logs_bucket_name,var.accountnumber)
  tags = {
    project =  "infra-basic"
  }
  acl    = null # conflicts with default of `acl = "private"` so set to null to use grants
  grant = [
    {
      id = data.aws_canonical_user_id.current.id
      type = "CanonicalUser"
      permissions = [ "FULL_CONTROL" ]
    },
  ]

  versioning = {
    enabled = true
  }
}
