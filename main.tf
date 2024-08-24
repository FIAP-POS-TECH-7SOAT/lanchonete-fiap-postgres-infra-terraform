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
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
  token      = var.aws_session_token
}

resource "aws_db_instance" "postgresql" {
  allocated_storage    = 10                       # Storage size in GB
  engine               = "postgres"               # Database engine
  engine_version       = "16.4"                   # PostgreSQL version
  instance_class       = "db.t3.micro"            # Instance type
  db_name              = var.postgres_db_name     # Database name
  username             = var.postgres_db_username # Master username
  password             = var.postgres_db_password # Master password
  parameter_group_name = "default.postgres16"     # Parameter group
  publicly_accessible  = true                     # Make the DB accessible from the public internet
  skip_final_snapshot  = true                     # Skip snapshot on deletion
  storage_type         = "gp2"                    # General Purpose SSD (gp2)
}