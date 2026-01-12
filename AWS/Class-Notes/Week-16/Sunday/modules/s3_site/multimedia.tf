resource "aws_s3_object" "beach_sound" {
  bucket        = aws_s3_bucket.site.id
  key           = "sounds/beach-waves.mp3"
  source        = "${path.module}/sounds/beach-waves.mp3"
  content_type  = "audio/mpeg"
  cache_control = "public, max-age=300"
}


resource "aws_s3_object" "mybackground1" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/mybackground1.jpg"
  source       = "${path.module}/images/mybackground1.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}

resource "aws_s3_object" "mybackground2" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/mybackground2.jpg"
  source       = "${path.module}/images/mybackground2.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}

resource "aws_s3_object" "mybackground3" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/mybackground3.jpg"
  source       = "${path.module}/images/mybackground3.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}

resource "aws_s3_object" "mybackground4" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/mybackground4.jpg"
  source       = "${path.module}/images/mybackground4.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}

resource "aws_s3_object" "mybackground5" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/mybackground5.jpg"
  source       = "${path.module}/images/mybackground5.jpg"
  content_type = "image/jpeg"
  cache_control = "public, max-age=604800"
}
