terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.9.0"
    }
  }
  backend "s3" {
    bucket = "REPLACE_ME"
    key    = "ca-lab/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_secretsmanager_secret" "mysql_login" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "secret_credentials" {
  secret_id = data.aws_secretsmanager_secret.mysql_login.id
}

resource "aws_db_instance" "db_two" {
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  allocated_storage    = var.allocated_storage

  username             = jsondecode(data.aws_secretsmanager_secret_version.secret_credentials.secret_string)["username"]
  password             = jsondecode(data.aws_secretsmanager_secret_version.secret_credentials.secret_string)["password"]
}