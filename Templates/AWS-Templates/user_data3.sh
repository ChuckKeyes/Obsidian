

#!/bin/bash
set -euxo pipefail
apt-get update -y
apt-get install -y nginx curl vim htop net-tools ca-certificates
systemctl enable nginx
systemctl start nginx
echo "Hello from ${HOSTNAME} (${PROJECT_NAME:-ck-lab})" > /var/www/html/index.nginx-debian.html
