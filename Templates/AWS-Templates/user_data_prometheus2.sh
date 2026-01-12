#!/bin/bash
set -xe

# Assume Amazon Linux 2 / RHEL-like
if command -v yum >/dev/null 2>&1; then
  yum update -y
  yum install -y wget tar
elif command -v apt-get >/dev/null 2>&1; then
  apt-get update -y
  apt-get install -y wget tar
fi

# Create user + dirs
useradd --no-create-home --shell /sbin/nologin prometheus || true
mkdir -p /etc/prometheus /var/lib/prometheus

cd /tmp

PROM_VERSION="2.52.0"
PROM_TAR="prometheus-${PROM_VERSION}.linux-amd64.tar.gz"
PROM_DIR="prometheus-${PROM_VERSION}.linux-amd64"

wget "https://github.com/prometheus/prometheus/releases/download/v${PROM_VERSION}/${PROM_TAR}"
tar xvf "${PROM_TAR}"

cp "${PROM_DIR}/prometheus" /usr/local/bin/
cp "${PROM_DIR}/promtool" /usr/local/bin/
cp -r "${PROM_DIR}/consoles" /etc/prometheus/
cp -r "${PROM_DIR}/console_libraries" /etc/prometheus/

cat > /etc/prometheus/prometheus.yml <<EOF
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'self'
    static_configs:
      - targets: ['localhost:9090']
EOF

chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus
chown prometheus:prometheus /usr/local/bin/prometheus /usr/local/bin/promtool

cat > /etc/systemd/system/prometheus.service <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/var/lib/prometheus \\
  --web.console.templates=/etc/prometheus/consoles \\
  --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable prometheus
systemctl start prometheus
