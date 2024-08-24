variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}

variable "aws_session_token" {
  description = "AWS Session Token"
  type        = string
}

variable "postgres_db_name" {
  description = "PostgreSQL name"
  type        = string
}

variable "postgres_db_username" {
  description = "PostgreSQL username"
  type        = string
}

variable "postgres_db_password" {
  description = "PostgreSQL password"
  type        = string
}