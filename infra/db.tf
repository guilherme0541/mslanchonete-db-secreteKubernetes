resource "aws_db_instance" "mslanchonetedb" {
  allocated_storage = 10
  storage_type      = "gp2"
  engine            = "postgres"
  engine_version    = "16"
  instance_class    = "db.t3.micro"
  identifier        = "${var.project_name}-db"
  db_name           = "lanchonete"
  username          = "dbuser"
  password          = var.db_password

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.mslanchonetedb_subnet_group.name

  skip_final_snapshot = true

  tags = {
    Name = "${var.project_name}-db"
  }
}

resource "aws_db_subnet_group" "mslanchonetedb_subnet_group" {
  name       = "${var.project_name}-subnet-group"
  subnet_ids = data.aws_subnets.mslanchonete_private_subnets.ids

  tags = {
    Name = "${var.project_name}-subnet-group"
  }
}