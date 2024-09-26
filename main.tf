terraform {
  backend "s3" {
    bucket = "ms-lanchonete"
    key    = "db-secret/terraform.tfstate"
    region = "us-east-1"
  }
}

module "mslanchonetedb_and_vpc" {
  source = "./infra"

  project_name = var.projectname
  region       = var.aws_region
  db_password  = var.dbpassword
}

variable "dbpassword"{
  type = string
  sensitive = true
}

variable "aws_region" {
  type = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "projectname" {
  type = string
  default = "mslanchonete"
  description = "Application Name"
}