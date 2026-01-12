# Get static assets

# create bucket

# Make it publically accessible

# Remove the  [block public access] setting
# 	add a bucket policy

# Enable static hosting

# static website url
# bucket name


####################################################


####################################################
# Variables
####################################################
variable "bucket_name" {
  description = "Name for the S3 static website bucket"
  type        = string
  default     = "ck-lab-static-site-chuck-001" # <-- CHANGE to a globally-unique name
}

####################################################
# S3 bucket + website hosting
####################################################
resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
}

# Ownership controls (required by newer AWS provider versions)
resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = aws_s3_bucket.site.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Allow public access (we’ll still control via bucket policy)
resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Enable static website hosting
resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }
}

  # error_document {
  #   key = "error.html"
  # }


####################################################
# index.html object (inline content)
####################################################
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.site.id
  key          = "index.html"
  content_type = "text/html"
  # acl          = "public-read"

  content = <<-HTML
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <title>ck-lab Gallery</title>
      <style>
        body {
          margin: 0;
          padding: 0;
          font-family: Arial, sans-serif;
          text-align: center;
          color: #222;
          background-image: url('images/background1.jpg'); /* upload this file too */
          background-size: cover;
          background-position: center;
          background-repeat: no-repeat;
          min-height: 100vh;
        }
        .overlay {
          background: rgba(255, 255, 255, 0.85);
          max-width: 1000px;
          margin: 40px auto;
          padding: 20px 30px;
          border-radius: 12px;
          box-shadow: 0 4px 16px rgba(0,0,0,0.3);
        }
        h1, h2, h3, p {
          margin: 10px 0;
        }
        .images {
          display: flex;
          flex-wrap: wrap;
          justify-content: center;
          gap: 16px;
          margin-top: 20px;
        }
        .images img {
          max-width: 220px;
          border-radius: 10px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.25);
        }
      </style>
    </head>
    <body>
      <div class="overlay">
        <h1>ck-lab Yoga Gallery</h1>
        <h2>Owner: Charles Keyes Sr.</h2>
        <p>Static site hosted on Amazon S3 (Out From The Deep)</p>

        <h3>Gallery</h3>
        <div class="images">
          <!-- Update these names to match the images you upload -->
          <img src="images/yoga/yoga1.png" alt="Photo 1">
          <img src="images/yoga/yoga2.png" alt="Photo 2">
          <img src="images/yoga/yoga3.png" alt="Photo 3">
          <img src="images/yoga/yoga4.png" alt="Photo 4">
          <img src="images/yoga/yoga5.png" alt="Photo 5">
          <img src="images/yoga/yoga6.png" alt="Photo 6">
          <img src="images/yoga/yoga7.png" alt="Photo 7">          
        </div>
      </div>
###############################################################################
      <!-- Music Controls -->
<button id="musicButton"
        style="
          position:fixed;
          top:15px;
          right:15px;
          padding:10px 18px;
          font-size:16px;
          border-radius:10px;
          cursor:pointer;
          z-index: 9999;">
  ▶ Play
</button>


<audio id="bgMusic" loop>
  <source src="music/song.mp3" type="audio/mpeg">
</audio>

<script>
  const audio = document.getElementById("bgMusic");
  const btn = document.getElementById("musicButton");

  btn.addEventListener("click", function () {
    if (audio.paused) {
      audio.play();
      btn.innerText = "⏸ Pause Music";
    } else {
      audio.pause();
      btn.innerText = "▶ Play Music";
    }
  });
</script>
###############################################################################
    </body>
    </html>
  HTML
}


####################################################
# Output the website URL
####################################################
output "website_url" {
  description = "Public S3 static website endpoint"
  value       = aws_s3_bucket_website_configuration.site.website_endpoint
}
