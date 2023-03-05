resource "aws_db_instance" "rds_instance" {
allocated_storage = var.allocated_storage
identifier = var.identifier
storage_type = var.storage_type
engine = var.engine
engine_version = var.engine_version
instance_class = var.instance_class
db_name = var.db_name
username = var.db_user_name
password = var.db_password
skip_final_snapshot    = true
vpc_security_group_ids = [aws_security_group.rds_sg.id]
  tags = {
    Name = var.db-tag
  }

}

resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.subnet-group-name
  description = var.subnet-group-description

  subnet_ids = [for subnet in aws_subnet.private-subnet: subnet.id]
}
resource "aws_security_group" "rds_sg" {
  vpc_id      = var.vpc-id
  name = var.rds-sg-name
        # Keep the instance private by only allowing traffic from the web server.
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["10.0.200.0/24"]
  }

  }
