####################################################
# Background image
####################################################
resource "aws_s3_object" "image_bg1" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/background5.jpg"
  content_type = "image/jpg"
  source       = "${path.module}/images/background1.jpg"
}

####################################################
# Gallery photos - each key AND source unique
####################################################


resource "aws_s3_object" "image_green6" {
  bucket       = aws_s3_bucket.site.id
  key          = "green/images6.jpg"
  # acl         = "public-read"
  content_type = "image/jpg"
  source       = "${path.module}/green/images6.jpg"
}

resource "aws_s3_object" "image_green7" {
  bucket       = aws_s3_bucket.site.id
  key          = "green/images7.jpg"
  # acl         = "public-read"
  content_type = "image/jpg"
  source       = "${path.module}/green/images7.jpg"
}


resource "aws_s3_object" "image_green8" {
  bucket       = aws_s3_bucket.site.id
  key          = "green/images8.jpg"
  # acl         = "public-read"
  content_type = "image/jpg"
  source       = "${path.module}/green/images8.jpg"
}


resource "aws_s3_object" "image_green9" {
  bucket       = aws_s3_bucket.site.id
  key          = "green/images9.jpg"
  # acl         = "public-read"
  content_type = "image/jpg"
  source       = "${path.module}/green/images9.jpg"
}


resource "aws_s3_object" "image_green10" {
  bucket       = aws_s3_bucket.site.id
  key          = "green/images10.jpg"
  # acl         = "public-read"
  content_type = "image/jpg"
  source       = "${path.module}/green/images10.jpg"
}


resource "aws_s3_object" "image_green11" {
  bucket       = aws_s3_bucket.site.id
  key          = "green/images11.jpg"
  # acl         = "public-read"
  content_type = "image/jpg"
  source       = "${path.module}/green/images11.jpg"
}


resource "aws_s3_object" "image_green12" {
  bucket       = aws_s3_bucket.site.id
  key          = "green/images12.jpg"
  # acl         = "public-read"
  content_type = "image/jpg"
  source       = "${path.module}/green/images12.jpg"
}

############################################################################
#############################  MUSIC    ####################################



resource "aws_s3_object" "music_song" {
  bucket       = aws_s3_bucket.site.id
  key          = "music/song.mp3"
  content_type = "audio/mpeg"
  source       = "${path.module}/music/song.mp3"
}
