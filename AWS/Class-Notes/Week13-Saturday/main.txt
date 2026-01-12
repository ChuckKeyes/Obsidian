# Security group for Prometheus VM
resource "aws_security_group" "prometheus_sg" {
  name        = "ck-prometheus-sg"
  description = "Security group for Prometheus VM"
  vpc_id      = var.vpc_id

  # SSH from admin
  ingress {
    description = "SSH from admin"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  # Prometheus UI from admin
  ingress {
    description = "Prometheus UI from admin"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  # Outbound (for scraping nodes + updates)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ck-prometheus-sg"
  }
}



# Prometheus instance
resource "aws_instance" "prometheus" {
  ami                    = var.ami_id_linux
  instance_type          = "t3.small"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.prometheus_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    set -xe

    # Detect package manager and install basics
    if command -v yum >/dev/null 2>&1; then
      yum update -y
      yum install -y wget tar
    elif command -v apt-get >/dev/null 2>&1; then
      apt-get update -y
      apt-get install -y wget tar
    fi

    # --- Create Prometheus user and directories ---
    useradd --no-create-home --shell /sbin/nologin prometheus || true

    mkdir -p /etc/prometheus
    mkdir -p /var/lib/prometheus
    chown prometheus:prometheus /var/lib/prometheus

    cd /opt

    # --- Download Prometheus ---
    PROM_VERSION="2.54.0"
    wget -q https://github.com/prometheus/prometheus/releases/download/v$PROM_VERSION/prometheus-$PROM_VERSION.linux-amd64.tar.gz
    tar xzf prometheus-$PROM_VERSION.linux-amd64.tar.gz

    cp prometheus-$PROM_VERSION.linux-amd64/prometheus /usr/local/bin/
    cp prometheus-$PROM_VERSION.linux-amd64/promtool /usr/local/bin/
    cp -r prometheus-$PROM_VERSION.linux-amd64/consoles /etc/prometheus/
    cp -r prometheus-$PROM_VERSION.linux-amd64/console_libraries /etc/prometheus/

    chown -R prometheus:prometheus /etc/prometheus
    rm -rf prometheus-$PROM_VERSION.linux-amd64*

    # --- Download node_exporter on the same VM ---
    NODE_VERSION="1.8.2"
    wget -q https://github.com/prometheus/node_exporter/releases/download/v$NODE_VERSION/node_exporter-$NODE_VERSION.linux-amd64.tar.gz
    tar xzf node_exporter-$NODE_VERSION.linux-amd64.tar.gz
    cp node_exporter-$NODE_VERSION.linux-amd64/node_exporter /usr/local/bin/
    rm -rf node_exporter-$NODE_VERSION.linux-amd64*

    # --- Prometheus configuration ---
    cat <<PROMCONF > /etc/prometheus/prometheus.yml
    global:
      scrape_interval: 15s

    scrape_configs:
      - job_name: 'prometheus'
        static_configs:
          - targets: ['localhost:9090']

      - job_name: 'nodes'
        static_configs:
          - targets: [${join(", ", formatlist("'%s'", var.node_targets))}]
    PROMCONF

    chown prometheus:prometheus /etc/prometheus/prometheus.yml

    # --- systemd service for Prometheus ---
    cat <<'PROMUNIT' > /etc/systemd/system/prometheus.service
    [Unit]
    Description=Prometheus
    Wants=network-online.target
    After=network-online.target

    [Service]
    User=prometheus
    Group=prometheus
    Type=simple
    ExecStart=/usr/local/bin/prometheus \
      --config.file=/etc/prometheus/prometheus.yml \
      --storage.tsdb.path=/var/lib/prometheus \
      --web.console.templates=/etc/prometheus/consoles \
      --web.console.libraries=/etc/prometheus/console_libraries

    Restart=on-failure

    [Install]
    WantedBy=multi-user.target
    PROMUNIT

    # --- systemd service for node_exporter ---
    cat <<'NODEUNIT' > /etc/systemd/system/node_exporter.service
    [Unit]
    Description=Node Exporter
    Wants=network-online.target
    After=network-online.target

    [Service]
    User=root
    Group=root
    Type=simple
    ExecStart=/usr/local/bin/node_exporter

    Restart=on-failure

    [Install]
    WantedBy=multi-user.target
    NODEUNIT

    # --- Enable and start both services ---
    systemctl daemon-reload
    systemctl enable prometheus
    systemctl enable node_exporter
    systemctl start prometheus
    systemctl start node_exporter
  EOF

  tags = {
    Name = "ck-prometheus-vm"
  }
}
