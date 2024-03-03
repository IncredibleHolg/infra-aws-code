# Main module for project

locals {
  stage = "private"
}

terraform {
  backend "s3" {
    bucket = "state-sync"
    key = "terraform/private/infra-basic/terraform.tfstate"
    region = "eu-central-1"
  }
  required_version = ">= 0.12.6"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper = false
  lower = true
}

provider "aws" {
  region  = var.region
}
