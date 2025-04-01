terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "statefile/terraform.tfstate" 
    region = "us-east-1"
  }
}
