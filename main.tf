# Provider configuration
provider "aws" {
  region = "ap-south-1"  
}
# Create two EC2 instances using count
resource "aws_instance" "example" {
  count         = var.
  ami           = 
  key_name      = "splunk"
  instance_type = "t2.micro"  # Example instance type
  
  # Dynamically assign names using count.index
  tags = {
    Name = 
  }

