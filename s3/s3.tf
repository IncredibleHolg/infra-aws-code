resource "aws_s3_bucket" "state-sync" {
  bucket = "state-sync"
  acl    = "private"
  
  versioning {
    enabled = true
  }
  
  tags = {
    Name        = "state-sync"
    Environment = "Private"
    Purpose  = "terraform-staging"
  }
}

# block public access on S3 bucket
resource "aws_s3_bucket_public_access_block" "dev-state-sync" {
  bucket = aws_s3_bucket.state-sync.id

  block_public_acls   = true
  block_public_policy = true
}