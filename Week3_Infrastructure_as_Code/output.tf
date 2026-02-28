output "server_public_ip" {
  value       = aws_instance.MyServer.public_ip
  description = "The public IP address of the main server"
}
