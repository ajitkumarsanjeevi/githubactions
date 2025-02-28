terraform {
  backend "s3" {
    bucket = "my-terrafom-state"
    key    = "statefile/terraform.tfstate"
    region = "ap-south-1"
  }
}
