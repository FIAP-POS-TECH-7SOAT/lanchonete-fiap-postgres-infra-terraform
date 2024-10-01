terraform {
  required_version = "1.9.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}


provider "aws" {
  region     = var.AWS_REGION
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  token      = var.AWS_SESSION_TOKEN
}

resource "aws_security_group" "postgresql_sg" {
  name        = "vpc_sg_prod"
  description = "Allow all TCP traffic for PostgreSQL"

  ingress {
    description = "Allow all TCP IPv4"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow all TCP IPv6"
    from_port        = 0
    to_port          = 65535
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_db_instance" "postgresql" {
  allocated_storage    = 10                       # Storage size in GB
  engine               = "postgres"               # Database engine
  engine_version       = "16.4"                   # PostgreSQL version
  instance_class       = "db.t3.micro"            # Instance type
  db_name              = var.POSTGRES_DB_NAME     # Database name
  username             = var.POSTGRES_DB_USERNAME # Master username
  password             = var.POSTGRES_DB_PASSWORD # Master password
  parameter_group_name = "default.postgres16"     # Parameter group
  publicly_accessible  = true                     # Make the DB accessible from the public internet
  skip_final_snapshot  = true                     # Skip snapshot on deletion
  storage_type         = "gp2"                    # General Purpose SSD (gp2)

  vpc_security_group_ids = [aws_security_group.postgresql_sg.id]
}