// Selecting the AMI of AWS Account 

data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

// Selecting VPC

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["ECN-VPC"]
  }
}

// Selecting Subnets

data "aws_subnet" "subnets" {
  count = length(var.subnetnames)
  filter {
    name   = "tag:Name"
    values = [element(var.subnetnames, count.index)]
  }
}

//Selecting Security Group

data "aws_security_group" "sg" {
  name = var.security_group_name
}

//Selecting KMS Key

data "aws_kms_key" "key_arn" {
  key_id = var.kms_key_arn
}
