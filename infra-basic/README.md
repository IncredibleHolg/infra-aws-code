# Infrastructure components for the Dashboard Deutschland application

Terraform Scripts to set up a basic set of infrastructure components to be shared between other stacks / applications

## Components handled by this project

* Elastic continer registy ( ecr )
* Codecommit environment
* IAM objects
* S3 logs bucket "logs-dd-dev"

## Projects using this infrastructure

* eks-dev
* All projects using Codecommit

## Manual changes

After the component creation, access to the s3 bucket "logs-dd-dev" was manually extended.
Running a terraform update will revert this.

```diff
  # module.s3_bucket_dd_logs.aws_s3_bucket.this[0] will be updated in-place
  ~ resource "aws_s3_bucket" "this" {
        id                          = "logs-dd-dev"
        tags                        = {}
        # (10 unchanged attributes hidden)

      - grant {
          - id          = "39febe4c67787d9a6e63e6bb720df5f365567fec3f43466e0a3b00a0d860812f" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }
      - grant {
          - id          = "c4c1ede66af53448b93c283ce9448c4ba468c9432aa01d700d3878632f77d2d0" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

        # (1 unchanged block hidden)
    }

```

## How to deploy

Run to create or update:

1. terraform init
2. terraform validate
3. terraform apply

run to delete:

1. terraform destroy
