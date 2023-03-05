variable "vpc-id"{
    description= "vpc id "
    type= string 
}
variable "internet-gateway"{
    description= "internet getway "
    type= string 
}
variable "private-subnet-tag"{
    description= "private subnet tag "
    type= string 
}
variable "cider-routing-table"{
    description= "cider routeing table"
    type= string 
}
variable "public-az"{
    description= " public availability zone "
    type= string 
}
variable "cidr_block"{
    description= " public cidr block "
    type= string 
}
variable "public-subnet-tag"{
    description= " public subnet tag "
    type= string 
}

variable "Routing-table-tag"{
    description= " Public Routing Table tag" 
    type= string 
    }

variable "allocated_storage"{
    description= " rds allocated storage " 
    type= number 
    }
variable "identifier"{
    description= " rds identifier" 
    type= string 
    }

variable "storage_type"{
    description= " rds storage type" 
    type= string 
    }

variable "engine"{
    description= " rds engine" 
    type= string 
    }
variable "engine_version"{
    description= " rds engine version" 
    type= string 
    }

variable "instance_class"{
    description= " rds instance_class" 
    type= string 
    }
variable "db_name"{
    description= " rds db_name" 
    type= string 
    }
variable "db-tag"{
    description= " rds tag" 
    type= string 
    }
variable "subnet-group-name"{
    description= " rds subnet group name" 
    type= string 
    }
variable "subnet-group-description"{
    description= " rds subnet group description" 
    type= string 
    }
variable "rds-sg-name"{
    description= " rds security group name" 
    type= string 
    }
variable "ec2-ami"{
    description= " ec2 ami" 
    type= string 
    }
variable "instance_type"{
    description= " instance type" 
    type= string 
    }
variable "ec2-tag"{
    description= " ec2 tag" 
    type= string 
    }
variable "ec2-sg-name"{
    description= " ec2 security group name" 
    type= string 
    }
variable "ec2-sg-description"{
    description= " ec2 security group description" 
    type= string 
    }
variable "ec2-sg-tag"{
    description= " ec2 security group tag" 
    type= string 
    }

variable "db-user-name"{
    description= " rds db name" 
    type= string 

    }

variable "db-password"{
    description= " rds db password" 
    type= string 

    }




#map of maps for create subnets
variable "prefix" {
   type = map
 default={
      sub-2 = {
         az = "eu-west-1b"
         cidr = "10.0.198.0/24"
      }
      sub-3 = {
         az = "eu-west-1c"
         cidr = "10.0.199.0/24"
      }
    
   }
}


