provider "aws" {
    region = var.aws_region
  
}
resource "aws_instance" "my_webserver" {

    count = 2
    ami = "ami-0bd99ef9eccfee250"
    instance_type = var.instance_type

    tags = {
        Name = count.index + 1
    }
}

## Security
resource "aws_security_group" "allow_ssh" {

    name        = "allow_ssh"
    description = "Allow ssh inbound traffic"

    ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port       = 22
      to_port         = 22
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "allow_http" {

    name        = "allow_http"
    description = "Allow http inbound traffic"

    ingress {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port       = 80
      to_port         = 80
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
    }
}