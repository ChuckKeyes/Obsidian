#!/bin/bash
set -eux

# Install Apache (Amazon Linux)
yum update -y
yum install -y httpd

systemctl enable httpd
systemctl start httpd

# Create web directory if missing
mkdir -p /var/www/html

# Write index.html
# cat <<'HTML' > /var/www/html/index.html
# $(cat /path/does/not/work)
# HTML
