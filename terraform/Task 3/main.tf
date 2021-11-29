provider "aws" {
    region = var.aws_region
  
}

## Instances
resource "aws_instance" "main_server" {

    ami = var.ami_type
    instance_type = var.instance_type
}
resource "aws_eip" "ip" {
  instance = aws_instance.main_server.id
  vpc      = true
}

resource "aws_instance" "second" {

    count = var.instance_count
    ami = var.ami_type
    instance_type = var.instance_type

    tags = {
        Name = count.index + 1
    }
}

## Security
resource "aws_security_group" "allow_tcps" {

  name        = "allow_22_80_1433"
  description = "Allow 22, 80, 144 tcp inbound traffic"

  dynamic "ingress" {
    for_each = ["22","80","1433"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = ["22","80","1433"]
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}