
variable "region" {
  type = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "db_password" {
  type = string
  description = "RDS root user password"
  sensitive   = true
}

variable "project_name" {
  type = string
  description = "Application Name"
}