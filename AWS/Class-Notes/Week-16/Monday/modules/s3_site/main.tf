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
  <meta charset="UTF-8">
  <title>KCS Slideshow</title>
  <style>
    body {
      margin: 0;
      background: #0b1f0b;
      font-family: Arial, sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
  <h1 id="siteTitle"></h1>

#siteTitle {
  position: absolute;
  top: 20px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 36px;
  font-weight: 700;
  color: white;
  letter-spacing: 2px;
  text-shadow: 0 4px 12px rgba(0,0,0,0.6);
  z-index: 10;
}

<script>
  const host = window.location.hostname;
  const subdomain = host.split(".")[0];

  document.getElementById("siteTitle").textContent =
    subdomain.charAt(0).toUpperCase() + subdomain.slice(1);
</script>


.slideshow {
  width: 100%;
  height: 100vh;
  position: relative;
  overflow: hidden;
  background: #000;
}

.slideshow img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;   /* fills the screen */
  opacity: 0;
  transition: opacity 1s ease-in-out;
}

    .slideshow img.active {
      opacity: 1;
    }
  </style>
</head>
<body>
<div class="slideshow">
  <img src="images/background1.jpg" class="active" alt="Background 1">
  <img src="images/background2.jpg" alt="Background 2">
  <img src="images/background3.jpg" alt="Background 3">
  <img src="images/background4.jpg" alt="Background 4">
  <img src="images/background5.jpg" alt="Background 5">
</div>


<script>
  const slides = document.querySelectorAll(".slideshow img");
  let index = 0;

  setInterval(() => {
    slides[index].classList.remove("active");
    index = (index + 1) % slides.length;
    slides[index].classList.add("active");
  }, 4000);
</script>

</body>
</html>
HTML
}



# content = <<-HTML<!DOCTYPE html>
# <html lang="en">
# <head>
#   <meta charset="UTF-8">
#   <title>KCS Slideshow</title>
#   <style>
#     body {
#       margin: 0;
#       background: #0b1f0b;
#       font-family: Arial, sans-serif;
#       display: flex;
#       align-items: center;
#       justify-content: center;
#       height: 100vh;
#     }

#     .slideshow {
#       width: 90%;
#       max-width: 900px;
#       height: 500px;
#       position: relative;
#       overflow: hidden;
#       border-radius: 14px;
#       box-shadow: 0 10px 30px rgba(0,0,0,0.4);
#       background: #000;
#     }

#     .slideshow img {
#       position: absolute;
#       width: 100%;
#       height: 100%;
#       object-fit: cover;
#       opacity: 0;
#       transition: opacity 1s ease-in-out;
#     }

#     .slideshow img.active {
#       opacity: 1;
#     }
#   </style>
# </head>
# <body>

# <div class="slideshow">
#   <img src="images/secure_global_network_slide_1.png" class="active">
#   <img src="images/secure_global_network_slide_2.png">
#   <img src="images/bgp-router.png">  
# </div>

# <script>
#   const slides = document.querySelectorAll(".slideshow img");
#   let index = 0;

#   setInterval(() => {
#     slides[index].classList.remove("active");
#     index = (index + 1) % slides.length;
#     slides[index].classList.add("active");
#   }, 4000); // change every 4 seconds
# </script>

# </body>
# </html>


# }
