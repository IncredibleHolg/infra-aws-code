project_name = "shared-infra"
region = "eu-central-1"
website_bucket_name = "public-website"
logs_bucket_name = "centrallogs"
accountnumber = "433352544266"
s3_vanilla18 = "vanilla18"
eks_dev_repository_name = "eks-dev"
default_branch = "main"
mcserverbackups = "mc-server-backups"
s3_haulaway = "haulaway"
s3_rendertest = "rendertest"
s3_mc_resources = "mc-resources"
eks_dev_repository_01_name = "eks-dev-01"
# when not calculating: "t2.micro"
# "t2.xlarge" is bursting, not suitable vor longer calculations
# Better a "m" instance, check which is compatible, try m5.xlarge
# variable ec2_type {
#  default = "m5.xlarge"
# }
# lora storage
s3_stdifstorage="stdifstorage"
ec2_type = "t2.micro"
