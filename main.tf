provider "aws" {   
region = "ap-south-1"    
}

resource "aws_vpc" "main" {             
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true 
  enable_dns_hostnames = true  

  tags = {
    Name = "MainVPC"
  }
}

resource "aws_subnet" "public_subnet_1" {   
  vpc_id                  = aws_vpc.main.id     
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"  

  tags = {
    Name = "PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "PublicSubnet2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "MainIGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route_table_association" "subnet_1_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "subnet_2_assoc" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "webtraffic" {
  name        = "webtraffic"
  description = "Allow inbound and outbound traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress-rules
    content {
         description      = "Inbound Rules"
         from_port        = port.value
         to_port          = port.value
         protocol         = "TCP"
         cidr_blocks      = ["0.0.0.0/0"] 
    }
  }

 dynamic "egress" {
    iterator = port
    for_each = var.egress-rules
    content {
         description      = "outbound Rules"
         from_port        = port.value
         to_port          = port.value
         protocol         = "TCP"
         cidr_blocks      = ["0.0.0.0/0"] 
    }
  }
}	

# EKS Cluster IAM Role
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach AWS Managed Policies for EKS Cluster
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role        = aws_iam_role.eks_cluster_role.name 
}

resource "aws_iam_role" "eks_worker_node_role" {        
  name = "example-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}





