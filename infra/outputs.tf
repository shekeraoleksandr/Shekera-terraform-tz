output "server_public_ip" {
  value       = module.server.public_ip
  description = "Public IP of web server"
}

output "db_public_ip" {
  value       = module.db.public_ip
  description = "Public IP of DB server"
}
