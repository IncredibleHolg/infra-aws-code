# Terraform staging resources

Terraform code to generate a S3 and a DynamoDB backend to hold Terraform state information.
This is used in other Terraform projects.


## How to deploy

Run to create or update:

1. terraform init
2. terraform validate
3. terraform apply

run to delete:

1. terraform destroy  ( S3 buckets can only be deleted, if the are empty)
