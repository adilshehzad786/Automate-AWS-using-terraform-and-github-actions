terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "remote" {
    organization = "adil"

    workspaces {
      name = "Automte-AWS-using-terraform-and-github-actions"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server-1" {
  ami           = "ami-830c94e3"
  instance_type = "t2.nano"
  tags = {
    Name = "server-1"
  }
}