provider "aws"{
  profile ="tushar"
  region ="ap-south-1"
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  identifier           = "maria-db"
  engine               = "mariadb"
  engine_version       = "10.4"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "tushardighe"
  password             = "redhat123"
  parameter_group_name = "default.mariadb10.4"
  skip_final_snapshot  = true
  #iam_database_authentication_enabled = true
  publicly_accessible = true
  tags = {
    Name = "mydb"
  }
}