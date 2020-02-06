provider "aws" {
  version = "~> 2.30"
}

provider "template" {
  version = "~> 2.1"
}

terraform {
  backend "s3" {
  }
}

data "aws_region" "current" {
}

data "aws_vpc" "dataplatform_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet_ids" "subnets" {
  vpc_id = local.vpc_id

  tags = {
    Type = "private"
  }
}