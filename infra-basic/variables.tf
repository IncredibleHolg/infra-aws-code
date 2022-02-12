variable "project_name" {}
variable "region" {
  default     = "eu-central-1"
  description = "AWS region"
}
variable website_bucket_name {}
variable logs_bucket_name {}
variable eks_dev_repository_name {
  default = "eks-dev"
}
variable eks_dev_repository_01_name {
  default = "eks-dev-01"
}
variable default_branch {
  default = "main"
}

variable accountnumber {
  default = "123456789"  
}

variable mcserverbackups {
  default = "mc-server-backups"
}

variable s3_vanilla18 {
  default = "vanilla18"
}

variable s3_mc_resources {
  default = "mc-resources"
}

# when not calculating: "t2.micro"
# "t2.xlarge" is bursting, not suitable vor longer calculations
# Better a "m" instance, check which is compatible, try m5.xlarge
# variable ec2_type {
#  default = "m5.xlarge"
# }
variable ec2_type {
  default = "t2.micro"
}
