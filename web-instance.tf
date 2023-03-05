resource "aws_instance" "my-ec2"{
    ami=var.ec2-ami
    instance_type=var.instance_type
     vpc_security_group_ids =[aws_security_group.ec2-sg.id]
     subnet_id      = aws_subnet.public_subnet.id
     tags = {
       Name = var.ec2-tag
     }
}
resource "aws_security_group" "ec2-sg" {
  vpc_id      = var.vpc-id
  name        = var.ec2-sg-name
  description = var.ec2-sg-description


  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }  
  ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }  
  ingress {
    description      = "https from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = var.ec2-sg-tag
  }
}
