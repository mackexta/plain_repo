# configured aws provider with proper credentials
provider "aws" {
  region    = "us-east-1"
  profile   = "kexta"
}



resource "aws_s3_bucket" "demo" {
  bucket = "kexta-jenkins"

  lifecycle {
    prevent_destroy = true
  }
}


resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.demo.id
  versioning_configuration {
    status = "Enabled"
  }
}
