# fetch vpc attribute (id)
data "aws_vpc" "selected" {
  id = var.vpc-id
}
# Internet gateway for the public subnet 
resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc-id
  tags = {
    Name =var.internet-gateway
  }
}
 # create private subnet
resource "aws_subnet" "private-subnet" {
  for_each = var.prefix
 
  availability_zone = each.value["az"]
  cidr_block = each.value["cidr"]
  vpc_id     = var.vpc-id

  tags = {
    Name = "subnet ${each.key}"
  }

}
# create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id  = var.vpc-id
  
availability_zone = var.public-az
cidr_block = var.cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name  = var.public-subnet-tag
  }
}

#creating routeing table
resource "aws_route_table" "rt" {

    vpc_id = var.vpc-id
    route {

        cidr_block = var.cider-routing-table
        gateway_id = aws_internet_gateway.ig.id
    }


    tags = {

        Name = var.Routing-table-tag
    }
    }
#  attaching route table to subnets created in order to provide access to internet.
resource "aws_route_table_association" "a" { 

   subnet_id      = aws_subnet.public_subnet.id
   route_table_id = aws_route_table.rt.id
    }
