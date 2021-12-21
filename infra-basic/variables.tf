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