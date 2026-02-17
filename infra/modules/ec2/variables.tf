variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  type        = bool
  default     = true
}

variable "allowed_ssh_cidr_blocks" {
  description = "CIDR blocks allowed to SSH to the instance"
  type        = list(string)
  default     = []
}

variable "app_port" {
  description = "Application port to allow inbound traffic"
  type        = number
  default     = 0
}

variable "allowed_app_port_cidr_blocks" {
  description = "CIDR blocks allowed to access the application port"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name prefix for EC2 resources"
  type        = string
}