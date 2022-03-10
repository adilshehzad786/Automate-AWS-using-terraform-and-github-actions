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

resource "aws_instance" "Terraform Server" {
  ami           = "ami-01b20f5ea962e3fe7"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-server"
  }
}