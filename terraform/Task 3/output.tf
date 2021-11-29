output "instance_ip_addr" {
  value = aws_instance.main_server.public_ip
}