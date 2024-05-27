terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    curl = {
      version = "1.0.2"
      source  = "anschoewe/curl"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

resource "aws_instance" "dockerhost" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.dockerhost-instance-type
  key_name      = aws_key_pair.dockerhost-key.key_name

  root_block_device {
    volume_size = 50
  }

  #subnet_id = aws_subnet.dockerhost-public-subnet[0].id
  vpc_security_group_ids      = [aws_security_group.external-access.id]
  associate_public_ip_address = true

  user_data = file("setup.sh")

  tags = {
    Name        = "Docker Host "
    description = "Dockerhost - Managed by Terraform"
    Owner_Name  = var.owner_name
    Owner_Email = var.owner_email
    sshUser     = "ubuntu"
    region      = var.region
  }

}

resource "aws_security_group" "external-access" {
  name        = "external-access-sg"
  description = "Allows free traffic from a specific IP"

  ingress {
    description = "Allow all access from a specific host"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [local.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "Dockerhost External Access"
    owner_email = var.owner_email
    owner_name  = var.owner_name
  }
}
