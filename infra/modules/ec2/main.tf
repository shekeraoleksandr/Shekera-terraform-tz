# EC2 instance using the latest Ubuntu AMI and the security group defined in security_groups.tf
resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.ec2.id]

  tags = var.tags
}
