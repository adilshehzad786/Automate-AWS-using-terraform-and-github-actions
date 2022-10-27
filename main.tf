terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "remote" {
    organization = "adil-test"

    workspaces {
      name = "Automte-AWS-using-terraform-and-github-actions"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "terraformserver" {
  ami           = "ami-01b20f5ea962e3fe7"
  instance_type = "t2.nano"
  tags = {
    Name = "Terraform-Server"
  }
}
resource "aws_ebs_volume" "terraformvolume" {
  availability_zone = "us-east-1a"
  size              = 40

  tags = {
    Name = "TerraformVolume"
  }
}
