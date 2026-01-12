resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = aws_s3_bucket.site.id
  rule { object_ownership = "BucketOwnerPreferred" }
}

resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id
  index_document { suffix = "index.html" }
  # error_document { key = "error.html" }
}

data "aws_iam_policy_document" "public_read" {
  statement {
    sid     = "PublicReadGetObject"
    effect  = "Allow"
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.site.arn}/*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.site.id
  policy = data.aws_iam_policy_document.public_read.json

  depends_on = [
    aws_s3_bucket_public_access_block.site
  ]
}

# starter index (replace later)
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.site.id
  key          = "index.html"
  content_type = "text/html"

  
content = <<-HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Waterfall Video</title>
  <style>
    html, body {
      margin: 0;
      height: 100%;
      background: #0b1f0b;
      font-family: Arial, sans-serif;
    }
    .wrap {
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 12px;
      box-sizing: border-box;
    }
    .player {
      width: 100%;
      max-width: 1100px;
      background: #ffffff;
      border-radius: 14px;
      overflow: hidden;
      box-shadow: 0 10px 30px rgba(0,0,0,0.35);
    }
    .bar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 10px 12px;
      border-bottom: 1px solid #e6e6e6;
    }
    .bar h1 {
      margin: 0;
      font-size: 16px;
      color: #0b1f0b;
      font-weight: 700;
    }
    .bar button {
      border: 0;
      padding: 10px 14px;
      border-radius: 10px;
      cursor: pointer;
      font-weight: 700;
      background: #0b7a2a;
      color: #ffffff;
    }
    video {
      width: 100%;
      height: auto;
      display: block;
      background: #000;
    }
  </style>
</head>
<body>
  <div class="wrap">
    <div class="player">
      <div class="bar">
        <h1>Green & White Waterfall</h1>
        <button id="fsBtn">⛶ Full Screen</button>
      </div>



      <video id="vid" controls playsinline preload="metadata">
        <source src="videos/waterfall.mp4" type="video/mp4" />
        Your browser does not support the video tag.
      </video>
    </div>
  </div>

  <script>
    const video = document.getElementById("vid");
    const btn = document.getElementById("fsBtn");

    function requestFullscreen(el) {
      if (el.requestFullscreen) return el.requestFullscreen();
      if (el.webkitRequestFullscreen) return el.webkitRequestFullscreen();
      if (el.msRequestFullscreen) return el.msRequestFullscreen();
    }

    btn.addEventListener("click", () => requestFullscreen(video));
  </script>
</body>
</html>
HTML

}
