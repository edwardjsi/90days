# main.tf

provider "aws" {
  region = var.region
}

# Reference your existing VPC
data "aws_vpc" "existing" {
  id = var.vpc_id
}

# Reference your existing public subnet
data "aws_subnet" "public" {
  id = var.public_subnet_id
}

# Optional: Reference private subnet if provided
data "aws_subnet" "private" {
  count = var.private_subnet_id != null ? 1 : 0
  id    = var.private_subnet_id
}

# Security Group (instance-level firewall)
resource "aws_security_group" "web_sg" {
  name        = "day5-web-security-group"
  description = "Allow SSH and HTTP on port 8000"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Web server on port 8000"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Day5-WebSG"
  }
}

# Network ACL (subnet-level stateless firewall)
resource "aws_network_acl" "secure_nacl" {
  vpc_id     = var.vpc_id
  subnet_ids = [var.public_subnet_id]  # Attach to your public subnet

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8000
    to_port    = 8000
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 9000
    to_port    = 9000
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port     = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "Day5-SecureNACL"
  }
}

# EC2 Instance running a simple web server
resource "aws_instance" "web" {
  ami                         = "ami-0e86e20dae9224db8"  # Ubuntu 22.04 LTS (us-east-1) — change if needed
  instance_type               = "t2.micro"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true  # Ensure public IP if your subnet doesn't auto-assign

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y python3
              nohup python3 -m http.server 8000 &
              EOF

  tags = {
    Name = "Day5-SecureWebInstance"
  }
}