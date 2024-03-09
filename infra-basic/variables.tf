locals{
#   AWS defined
  minecraft_map_policy_id =   "658327ea-f89d-4fab-a63d-7e88639e58f6"
}


variable "project_name" {}
variable "region" {}
variable website_bucket_name {}
variable logs_bucket_name {}
variable eks_dev_repository_name {}
variable eks_dev_repository_01_name {}
variable default_branch {}
variable accountnumber {}
variable mcserverbackups {}
variable s3_vanilla18 {}
variable s3_haulaway {}
variable s3_rendertest {}
variable s3_mc_resources {}

# when not calculating: "t2.micro"
# "t2.xlarge" is bursting, not suitable vor longer calculations
# Better a "m" instance, check which is compatible, try m5.xlarge
# variable ec2_type {
#  default = "m5.xlarge"
# }
variable ec2_type {}

# Lora storage
variable "s3_stdifstorage" {}
