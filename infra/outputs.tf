output "server_public_ip" {
  value       = aws_instance.server.public_ip
  description = "Public IP of web server"
}

output "db_public_ip" {
  value       = aws_instance.db.public_ip
  description = "Public IP of DB server"
}
