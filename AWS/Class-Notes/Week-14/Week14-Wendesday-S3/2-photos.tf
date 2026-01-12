####################################################
# Background image
####################################################
resource "aws_s3_object" "image_bg1" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/background1.jpg"
  content_type = "image/jpg"
  source       = "${path.module}/images/background1.jpg"
}

####################################################
# Gallery photos - each key AND source unique
####################################################


resource "aws_s3_object" "image_yoga1" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/yoga/yoga1.png"
  # acl         = "public-read"
  content_type = "image/png"
  source       = "${path.module}/images/yoga/yoga1.png"
}

resource "aws_s3_object" "image_yoga2" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/yoga/yoga2.png"
  # acl         = "public-read"
  content_type = "image/png"
  source       = "${path.module}/images/yoga/yoga2.png"
}


resource "aws_s3_object" "image_yoga3" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/yoga/yoga3.png"
  # acl         = "public-read"
  content_type = "image/png"
  source       = "${path.module}/images/yoga/yoga3.png"
}


resource "aws_s3_object" "image_yoga4" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/yoga/yoga4.png"
  # acl         = "public-read"
  content_type = "image/png"
  source       = "${path.module}/images/yoga/yoga4.png"
}


resource "aws_s3_object" "image_yoga5" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/yoga/yoga5.png"
  # acl         = "public-read"
  content_type = "image/png"
  source       = "${path.module}/images/yoga/yoga5.png"
}


resource "aws_s3_object" "image_yoga6" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/yoga/yoga6.png"
  # acl         = "public-read"
  content_type = "image/png"
  source       = "${path.module}/images/yoga/yoga6.png"
}


resource "aws_s3_object" "image_yoga7" {
  bucket       = aws_s3_bucket.site.id
  key          = "images/yoga/yoga7.png"
  # acl         = "public-read"
  content_type = "image/png"
  source       = "${path.module}/images/yoga/yoga7.png"
}

############################################################################
#############################  MUSIC    ####################################



resource "aws_s3_object" "music_song" {
  bucket       = aws_s3_bucket.site.id
  key          = "music/song.mp3"
  content_type = "audio/mpeg"
  source       = "${path.module}/music/song.mp3"
}
