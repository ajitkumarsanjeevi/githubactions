terraform {
  backend "s3" {
    bucket = "my-terrafom-eks"
    key    = "statefile/terraform.tfstate" 
    region = "ap-south-1"
  }
}
