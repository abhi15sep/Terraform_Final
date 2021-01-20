# Defining S3 bucket

resource "aws_s3_bucket" "inder-bucket-1993" {
  bucket          = "inder-bucket-1993"
  acl             = "private"
  tags            = {
    Name          = "inder-bucket-1993"
  }
}
