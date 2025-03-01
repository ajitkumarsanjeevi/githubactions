# Provider configuration 
provider "aws" { 
  region = "ap-south-1"  
}


#security group

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

# Create two EC2 instances using count
resource "aws_instance" "example" {
  ami           = "ami-02ddb77f8f93ca4ca"
  key_name      = "splunk"
  instance_type = "t2.micro" 
  vpc_security_group_ids = [aws_security_group.webtraffic.id]

  tags = {
    Name = "instance-1"
  }
}
