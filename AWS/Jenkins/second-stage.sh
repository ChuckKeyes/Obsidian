#!/bin/bash
set -euxo pipefail

# Log everything
exec > >(tee /var/log/jenkins-bootstrap.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "[INFO] Configure /tmp to 2G"
mkdir -p /etc/systemd/system/tmp.mount.d
cat > /etc/systemd/system/tmp.mount.d/override.conf <<'EOF'
[Mount]
Options=mode=1777,strictatime,nosuid,nodev,size=2G
EOF

systemctl daemon-reload
mount -o remount,size=2G /tmp || true
df -h /tmp || true

echo "[INFO] Update OS"
dnf update -y

echo "[INFO] Install base tools"
dnf install -y wget unzip git python3 awscli fontconfig yum-utils java-21-amazon-corretto

echo "[INFO] Add HashiCorp repo and install Terraform"
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
dnf install -y terraform

echo "[INFO] Add Jenkins repo"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/rpm-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key || true

echo "[INFO] Refresh package metadata"
dnf clean all
dnf makecache

echo "[INFO] Install Jenkins"
dnf install -y jenkins

echo "[INFO] Set Java 21 as default"
alternatives --set java /usr/lib/jvm/java-21-amazon-corretto.x86_64/bin/java || true

echo "[INFO] Create plugin list"
mkdir -p /opt/jenkins-bootstrap
cat > /opt/jenkins-bootstrap/plugins.txt <<'EOF'
github
github-oauth
pipeline-github
pipeline-githubnotify-step
javax-mail-api
terraform
aws-credentials
pipeline-aws
EOF

echo "[INFO] Create second-stage plugin installer"
cat > /opt/jenkins-bootstrap/install-plugins.sh <<'EOF'
#!/bin/bash
set -euxo pipefail

exec > >(tee -a /var/log/jenkins-plugin-bootstrap.log | logger -t jenkins-plugin-bootstrap -s 2>/dev/console) 2>&1

MARKER="/var/lib/jenkins/.plugins_bootstrapped"
JENKINS_URL="http://127.0.0.1:8080/login"
PLUGIN_FILE="/opt/jenkins-bootstrap/plugins.txt"
PLUGIN_DIR="/var/lib/jenkins/plugins"
PLUGIN_MANAGER_JAR="/opt/jenkins-bootstrap/jenkins-plugin-manager.jar"

if [ -f "$MARKER" ]; then
  echo "[INFO] Plugins already bootstrapped"
  exit 0
fi

echo "[INFO] Wait for Jenkins UI"
for i in {1..90}; do
  if wget -q -O /dev/null "$JENKINS_URL"; then
    echo "[INFO] Jenkins UI is reachable"
    break
  fi
  sleep 5
done

if ! wget -q -O /dev/null "$JENKINS_URL"; then
  echo "[ERROR] Jenkins UI never became reachable"
  exit 1
fi

echo "[INFO] Download Jenkins Plugin Manager"
wget -O "$PLUGIN_MANAGER_JAR" \
  https://github.com/jenkinsci/plugin-installation-manager-tool/releases/latest/download/jenkins-plugin-manager.jar

mkdir -p "$PLUGIN_DIR"

echo "[INFO] Install requested plugins"
java -jar "$PLUGIN_MANAGER_JAR" \
  --war /usr/share/java/jenkins.war \
  --plugin-download-directory "$PLUGIN_DIR" \
  --plugin-file "$PLUGIN_FILE"

echo "[INFO] Fix plugin ownership"
chown -R jenkins:jenkins /var/lib/jenkins

touch "$MARKER"

echo "[INFO] Restart Jenkins after plugin installation"
systemctl restart jenkins
EOF

chmod +x /opt/jenkins-bootstrap/install-plugins.sh

echo "[INFO] Create systemd one-shot service for plugin bootstrap"
cat > /etc/systemd/system/jenkins-plugin-bootstrap.service <<'EOF'
[Unit]
Description=Install Jenkins plugins after Jenkins is up
After=network-online.target jenkins.service
Wants=network-online.target
Requires=jenkins.service

[Service]
Type=oneshot
ExecStart=/opt/jenkins-bootstrap/install-plugins.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

echo "[INFO] Enable and start Jenkins"
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

echo "[INFO] Enable plugin bootstrap service"
systemctl enable jenkins-plugin-bootstrap.service
systemctl start jenkins-plugin-bootstrap.service || true

echo "[INFO] Save initial admin password if present"
for i in {1..30}; do
  if [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; then
    cp /var/lib/jenkins/secrets/initialAdminPassword /root/jenkins-admin-password.txt
    break
  fi
  sleep 5
done

echo "[INFO] Final status"
systemctl status jenkins --no-pager || true
systemctl status jenkins-plugin-bootstrap.service --no-pager || true
terraform version || true
aws --version || true
python3 --version || true
df -h /tmp || true