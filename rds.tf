#RDS作成
resource "aws_db_subnet_group" "db" {
  name        = "tf_dbsubnet"
  description = "It is a DB subnet group on tf_vpc."
  subnet_ids  = flatten([aws_subnet.private1.id, aws_subnet.private2.id])
  tags = {
    Name = "tf_dbsubnet"
  }
}

resource "aws_db_instance" "db" {
  identifier             = "sample-rds"
  skip_final_snapshot    = true
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "5.7.26"
  instance_class         = "db.t2.micro"
  storage_type           = "gp2"
  username               = var.aws_db_username
  password               = var.aws_db_password
  vpc_security_group_ids = [aws_security_group.db.id]
  db_subnet_group_name   = aws_db_subnet_group.db.name
}
