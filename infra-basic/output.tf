output "region" {
  description = "AWS region."
  value       = var.region
}

output "s3_logs_bucket-regional-domain" {
  description = "DD-S3-Log-Domain."
  value       = module.s3_bucket_logs.s3_bucket_bucket_regional_domain_name

}

# output "repository_url" {
#   description = "repository_url"
#   value       = aws_ecr_repository.ecr-dd.repository_url

# }