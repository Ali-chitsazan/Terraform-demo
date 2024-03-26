terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"


}

resource "aws_vpc" "tf-dev-vpc" {
  cidr_block = "172.30.0.0/16"
  tags = {
    "Name" = "Dev-VPC"
  }
}

resource "aws_subnet" "tf-dev-subnet" {

  vpc_id                  = aws_vpc.tf-dev-vpc.id
  cidr_block              = "172.30.1.0/24"
  availability_zone       = "ca-central-1a"
  map_public_ip_on_launch = true
  tags = {
    "Name" = "dev-subnet-1"
  }

}

output "tf-dev-vpc_id" {
  value = aws_vpc.tf-dev-vpc.id

}
