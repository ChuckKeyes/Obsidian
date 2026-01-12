resource "aws_s3_object" "background1" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/background1.jpg"
  source       = "${path.module}/images/background1.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}

resource "aws_s3_object" "background2" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/background2.jpg"
  source       = "${path.module}/images/background2.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}

resource "aws_s3_object" "background3" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/background3.jpg"
  source       = "${path.module}/images/background3.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}

resource "aws_s3_object" "background4" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/background4.jpg"
  source       = "${path.module}/images/background4.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}

resource "aws_s3_object" "background5" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/background5.jpg"
  source       = "${path.module}/images/background5.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}
