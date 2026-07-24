resource "aws_s3_bucket" "websites" {

  bucket = "keyescloudsolutions-websites"

  tags = {

    Name    = "Keyes Cloud Solutions Websites"

    Project = "Kubernetes Lab"

  }

}

# Enable versioning

resource "aws_s3_bucket_versioning" "websites" {

  bucket = aws_s3_bucket.websites.id

  versioning_configuration {

    status = "Enabled"

  }

}

# Enable website hosting:

resource "aws_s3_bucket_website_configuration" "websites" {

  bucket = aws_s3_bucket.websites.id

  index_document {

    suffix = "index.html"

  }

}