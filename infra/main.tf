resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

module "server" {
  source = "./modules/ec2"

  name                         = "Server"
  instance_type                = "t3.small"
  key_name                     = aws_key_pair.deployer.key_name
  associate_public_ip_address  = true
  allowed_ssh_cidr_blocks      = [var.SSH_IP]
  app_port                     = 8080
  allowed_app_port_cidr_blocks = ["0.0.0.0/0"]
}

module "db" {
  source = "./modules/ec2"

  name                         = "DB"
  instance_type                = "t3.micro"
  key_name                     = aws_key_pair.deployer.key_name
  associate_public_ip_address  = true
  allowed_ssh_cidr_blocks      = [var.SSH_IP]
  app_port                     = 3306
  allowed_app_port_cidr_blocks = ["0.0.0.0/0"]
}
