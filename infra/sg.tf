locals {
  sg_name = "${var.project_name}-rds-sg"
}

resource "aws_security_group" "rds_sg" {
  name = local.sg_name

  vpc_id = data.aws_vpc.mslanchonete_vpc.id

  # Add any additional ingress/egress rules as needed
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = local.sg_name
  }
}