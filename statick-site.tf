provider "aws" {
    profile = "terraform"
    region = "us-east-2"
}

resource "aws_s3_bucket" "bucketfortesting" {
  bucket = "qant-bucket"
  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}  
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucketfortesting.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}
