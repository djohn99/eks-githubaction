terraform {
    
    backend "s3" {
    bucket = "daveks-tf-bucket"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}