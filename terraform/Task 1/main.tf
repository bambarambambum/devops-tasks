terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

# SSH key pair
resource "aws_key_pair" "default" {
  key_name = var.key_name
  public_key = file(var.key_path)
}

# Instance
resource "aws_instance" "app" {

  ami           = "ami-05f7491af5eef733a"
  count = 2
  instance_type = var.instance_type
  associate_public_ip_address = true
  key_name = var.key_name
}
