terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "myapp-bucket-s3"
    key = "myapp/state/state.tfstate"
    region = "eu-central-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.availability_zone

}

# Create a VPC
resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
    vpc_env = var.env_prefix
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "myapp-vpc"
  cidr = var.vpc_cidr_block

  azs             = [var.availability_zonea, var.availability_zoneb]
  public_subnets  = [var.subnet_cidr_block[0], var.subnet_cidr_block[1]]

  tags = {
    Name = "${var.env_prefix}-vpc"
  }

  public_subnet_names = ["${var.env_prefix}-subnet-1", "${var.env_prefix}-subnet-2"]
}

module "myapp-server" {
  source = ".\\modules\\webserver"
  env_prefix = var.env_prefix
  my_ip = var.my_ip
  public_key = var.public_key
  instance_type = var.instance_type
  az_subnet_prefix = var.az_subnet_prefix
  vpc_id = module.vpc.vpc_id
  availability_zone = var.availability_zone
  webserver_subnet_id = module.vpc.public_subnets[0]
  runner_token = var.runner_token
  private_key = var.private_key
}