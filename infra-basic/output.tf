output "region" {
  description = "AWS region."
  value       = var.region
}
 
output "s3_server_backups" {
  description = "DD-S3-Log-Domain."
  value       = aws_s3_bucket.s3_server_backups.bucket_regional_domain_name
}

output "s3_mc_resources" {
  description = "S3 for resources"
  value       = aws_s3_bucket.s3_mc_resources.bucket_regional_domain_name
}

output "s3_vanilla18" {
  description = "S3 for vanilla18 map"
  value       = aws_s3_bucket.s3_vanilla18.bucket_regional_domain_name
}


output "s3_bucket_logs" {
  description = "repository_url"
  value       = aws_s3_bucket.s3_bucket_logs.bucket_regional_domain_name

}
output "ec2_public_dns" {
  description = "Public DNS ec2 instance"
  value = aws_instance.overviewerworker.public_dns
}

output "ec2_instance_id" {
  description = "Instance ID"
  value = aws_instance.overviewerworker.id
}

output "minecraftstorage" {
  description = "DNS of EFS Volume to hold data" 
  value = aws_efs_file_system.minecraftstorage.dns_name
}
# file-system-id:/ efs-mount-point efs _netdev,tls,iam 0 0
# file-system-id:/ /home/ec2-user/WRK efs _netdev,tls,iam 0 0