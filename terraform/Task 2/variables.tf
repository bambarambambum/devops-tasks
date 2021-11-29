variable "aws_region" {
  description = "Region for the VPC"
  default = "eu-central-1"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "~/.ssh/androsovm.pub"
}

variable "key_name" {
  description = "SSH Private Key Name"
  default = "androsovm"
}

variable "instance_type" {
    description = "Instance type"
    default = "t2.micro"
}
