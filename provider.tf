terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["/Users/Rajat/.aws/config"]
  shared_credentials_files = ["/Users/Rajat/.aws/credentials"]
  profile                  = "default"
}
