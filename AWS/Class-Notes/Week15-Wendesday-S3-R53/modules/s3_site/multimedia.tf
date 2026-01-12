resource "aws_s3_object" "waterfall_video" {
  bucket       = aws_s3_bucket.site.id
  key          = "videos/waterfall.mp4"
  source       = "${path.module}/videos/waterfall.mp4"
  content_type = "video/mp4"

  cache_control = "public, max-age=604800" # 7 days
}
