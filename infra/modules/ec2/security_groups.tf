resource "aws_security_group" "ec2" {
  name = "${var.name}-security-group"

  tags = {
    Name = "${var.name}-sg"
  }
}

# Allow SSH only from the specified CIDR blocks, skipped if none provided
resource "aws_security_group_rule" "ssh_ingress" {
  count             = length(var.allowed_ssh_cidr_blocks) > 0 ? 1 : 0
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2.id
  cidr_blocks       = var.allowed_ssh_cidr_blocks
  description       = "Allow SSH access"
}

# Allow inbound traffic on the application port, skipped if app_port is 0
resource "aws_security_group_rule" "app_port_ingress" {
  count             = var.app_port > 0 ? 1 : 0
  type              = "ingress"
  from_port         = var.app_port
  to_port           = var.app_port
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2.id
  cidr_blocks       = var.allowed_app_port_cidr_blocks
  description       = "Allow application traffic on port ${var.app_port}"
}

# Allow all outbound traffic
resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.ec2.id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow all outbound traffic"
}
