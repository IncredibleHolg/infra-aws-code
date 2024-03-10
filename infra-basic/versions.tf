terraform {
  required_version = ">= 0.13.1"

  required_providers {
    aws        = "~> 5.0"
    local      = ">= 1.4"
 #   null       = ">= 2.1"
 #   template   = ">= 2.1"
    random     = ">= 2.1"
 #   kubernetes = "~> 1.11"
 #   helm       = ">=2.1.2"
  }
}