output "region" {
  description = "AWS region."
  value       = var.region
}
 
  output "s3_server_backups" {
  description = "DD-S3-Log-Domain."
  value       = aws_s3_bucket.s3_server_backups.bucket_regional_domain_name
}

output "s3_bucket_logs" {
  description = "repository_url"
  value       = aws_s3_bucket.s3_bucket_logs.bucket_regional_domain_name

}
output "ec2_public_dns" {
  description = "Public DNS ec2 instance"
  value = aws_instance.overviewerworker.public_dns
}