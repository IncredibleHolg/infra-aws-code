# Main module for project

locals {
  stage = "dev"
}

terraform {
  required_version = ">= 0.12.6"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

provider "aws" {
  region  = "eu-central-1"
}

