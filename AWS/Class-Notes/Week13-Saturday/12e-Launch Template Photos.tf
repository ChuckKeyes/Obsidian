resource "aws_launch_template" "web" {
  name_prefix   = "ck-web-lt-"
  image_id      = "ami-0fa3fe0fa7920f68e"   # same AMI you used before
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.targets_sg.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    set -xe

    # --- Install web server (Apache/HTTPD) + git ---
    if command -v yum >/dev/null 2>&1; then
      yum update -y
      yum install -y httpd wget tar git
      systemctl enable httpd
      systemctl start httpd
      WEBROOT="/var/www/html"
    elif command -v apt-get >/dev/null 2>&1; then
      apt-get update -y
      apt-get install -y apache2 wget tar git
      systemctl enable apache2
      systemctl start apache2
      WEBROOT="/var/www/html"
    else
      WEBROOT="/var/www/html"
    fi

    # --- Clone GitHub repo with photos and copy to web root ---
    git clone https://github.com/ChuckKeyes/Obsidian.git /opt/obsidian || true

    mkdir -p $WEBROOT/images
    cp /opt/obsidian/Photos/*.jpg $WEBROOT/images/ || true

    # ------------------------------------------------------
    # Detect this instance's AZ and choose background
    # ------------------------------------------------------
    AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone || echo "unknown")

    case "$AZ" in
      us-east-1a)
        BG_IMAGE="background1.jpg"
        ;;
      us-east-1b)
        BG_IMAGE="background2.jpg"
        ;;
      us-east-1c)
        BG_IMAGE="background3.jpg"
        ;;
      *)
        # Default background if AZ is unknown or different
         BG_IMAGE="background4.jpg"
        ;;
    esac

    echo "AZ: $AZ  ->  Background: $BG_IMAGE" >> /var/log/user-data.log

    # --- HTML page with dynamic background + text + 7 photos --- 
    cat <<HTML > $WEBROOT/index.html
    <html>
      <head>
        <title>ck-lab ASG instance</title>
        <style>
          body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            text-align: center;
            color: #222;
            background-image: url('/images/$BG_IMAGE');
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
          <h1>ck-lab ASG instance: $(hostname -f)</h1>
          <h2>Owner: Charles Keyes Sr.</h2>
          <p>Repo: ChuckKeyes/Obsidian (Photos copied locally)</p>

          <h3>Gallery</h3>
          <div class="images">
            # <img src="/images/green/images1.jpeg" alt="Photo 1" />
            # <img src="/images/green/images6.jpeg" alt="Photo 2" />
            # <img src="/images/green/images7.jpeg" alt="Photo 3" />
            # <img src="/images/green/images8.jpeg" alt="Photo 4" />
            # <img src="/images/green/images9.jpeg" alt="Photo 5" />
            # <img src="/images/green/images10.jpeg" alt="Photo 6" />
            # <img src="/images/green/images11.jpeg" alt="Photo 7" />
            # <img src="/images/green/images12.jpeg" alt="Photo 8" />
            <img src="/images/dominican1.jpg" alt="Photo 1" />
            <img src="/images/dominican2.jpg" alt="Photo 2" />
            <img src="/images/dominican3.jpg" alt="Photo 3" />
            <img src="/images/dominican4.jpg" alt="Photo 4" />
            <img src="/images/dominican5.jpg" alt="Photo 5" />
            <img src="/images/dominican6.jpg" alt="Photo 6" />
            <img src="/images/dominican7.jpg" alt="Photo 7" />
            <img src="/images/dominican7.jpg" alt="Photo 8" />
          </div>
        </div>
      </body>
    </html>
    HTML
  EOF
  )
}
