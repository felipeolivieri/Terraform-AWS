resource "aws_s3_bucket" "dev4" {
    bucket = "disk01-dev4"
    acl = "private"

    tags = { 
        Name = "disk01-dev4"
    }
}