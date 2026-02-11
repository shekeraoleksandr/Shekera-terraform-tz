resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_ed25519.pub")
}

resource "aws_security_group" "server_sg" {
  name = "server-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "server-sg"
  }
}

resource "aws_security_group" "db_sg" {
  name = "db-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}

resource "aws_instance" "server" {
  ami                         = "ami-0b6c6ebed2801a5cb"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.server_sg.id]

  tags = {
    Name = "Server"
  }
}

resource "aws_instance" "db" {
  ami                         = "ami-0b6c6ebed2801a5cb"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.db_sg.id]

  tags = {
    Name = "DB"
  }
}
