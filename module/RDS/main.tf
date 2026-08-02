resource "aws_db_subnet_group" "main" {
  name       = "rds_subnet_group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage = 100
  db_name           = var.db_name
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  username          = var.db_username
  password          = var.db_password

  db_subnet_group_name = aws_db_subnet_group.main.name

  parameter_group_name = "default.postgresql13"
  skip_final_snapshot  = true

  publicly_accessible = false
}
