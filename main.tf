# Provider configuration
provider "aws" {
  region = "ap-south-1"  
}
# Create two EC2 instances using count
resource "aws_instance" "example" {
  count         = length(var.instance_names)
  ami           = "ami-02ddb77f8f93ca4ca"
  key_name      = "splunk"
  instance_type = "t2.micro" 

  tags = {
    Name = var.instance_names[count.index]
  }
}
