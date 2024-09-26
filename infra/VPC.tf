data "aws_vpc" "mslanchonete_vpc" {
  filter {
    name = "tag:Name"
    values = ["${var.project_name}-vpc"]
  }
}

data "aws_subnets" "mslanchonete_private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.mslanchonete_vpc.id]
  }

  filter {
    name = "tag:type"
    values = [ "private" ]
  }
}