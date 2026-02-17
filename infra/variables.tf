variable "ACCESS_KEY" {
  description = "Access key"
  type        = string
  sensitive   = true
}

variable "SECRET_KEY" {
  description = "Secret key"
  type        = string
  sensitive   = true
}

variable "SSH_IP" {
  description = "CIDR blocks allowed to access the SSH port"
  type        = string
  sensitive   = true
}
