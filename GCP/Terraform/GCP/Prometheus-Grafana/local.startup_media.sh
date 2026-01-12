#!/usr/bin/env bash
set -euo pipefail

DISK_NAME="disk-media-data"
DEVICE="/dev/disk/by-id/google-${DISK_NAME}"
MNT="/mnt/disk-media-data"

echo "==> Ensure disk device exists: ${DEVICE}"
if [[ ! -e "${DEVICE}" ]]; then
  echo "ERROR: ${DEVICE} not found. Make sure your PD is attached and named ${DISK_NAME}." >&2
  exit 1
fi

echo "==> Create mount point"
sudo mkdir -p "${MNT}"

echo "==> Format disk if needed"
# If no filesystem, mkfs.ext4 (safe: checks first)
if ! lsblk -f "${DEVICE}" | grep -qE "ext4"; then
  sudo mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard "${DEVICE}"
fi

echo "==> Get UUID & add to /etc/fstab if not present"
UUID=$(sudo blkid -s UUID -o value "${DEVICE}")
FSTAB_LINE="UUID=${UUID}  ${MNT}  ext4  discard,defaults  0  2"
if ! grep -q "${UUID}" /etc/fstab; then
  echo "${FSTAB_LINE}" | sudo tee -a /etc/fstab >/dev/null
fi

echo "==> Mount disk"
sudo mount -a

echo "==> Prepare directories on the persistent disk"
sudo mkdir -p \
  "${MNT}/docker" \
  "${MNT}/jellyfin/config" \
  "${MNT}/jellyfin/cache" \
  "${MNT}/media"

echo "==> Install Docker (Debian/Ubuntu)"
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update -y
sudo apt-get install -y docker.io
sudo systemctl enable docker

echo "==> Point Docker data-root to the persistent disk"
sudo mkdir -p /etc/docker
DOCKER_DAEMON_JSON="/etc/docker/daemon.json"
if [[ -f "${DOCKER_DAEMON_JSON}" ]]; then
  # Merge/replace data-root only; simplest is to replace if different
  sudo jq --arg root "${MNT}/docker" '.["data-root"]=$root' "${DOCKER_DAEMON_JSON}" \
    | sudo tee "${DOCKER_DAEMON_JSON}.tmp" >/dev/null || { echo '{"data-root":"'"${MNT}/docker"'"}' | sudo tee "${DOCKER_DAEMON_JSON}.tmp" >/dev/null; }
  sudo mv "${DOCKER_DAEMON_JSON}.tmp" "${DOCKER_DAEMON_JSON}"
else
  echo '{"data-root":"'"${MNT}/docker"'"}' | sudo tee "${DOCKER_DAEMON_JSON}" >/dev/null
fi

echo "==> Restart Docker to apply data-root"
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "==> Create systemd service for Jellyfin (container)"
JFSVC="/etc/systemd/system/jellyfin-docker.service"
sudo tee "${JFSVC}" >/dev/null <<'UNIT'
[Unit]
Description=Jellyfin in Docker (media on persistent disk)
After=docker.service
Requires=docker.service

[Service]
Type=notify
Restart=always
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker rm -f jellyfin
ExecStartPre=/usr/bin/docker pull jellyfin/jellyfin:latest
ExecStart=/usr/bin/docker run \
  --name jellyfin \
  --publish 8096:8096 \
  --publish 8920:8920 \
  --volume /mnt/disk-media-data/jellyfin/config:/config \
  --volume /mnt/disk-media-data/jellyfin/cache:/cache \
  --volume /mnt/disk-media-data/media:/media \
  --restart=unless-stopped \
  jellyfin/jellyfin:latest

ExecStop=/usr/bin/docker stop jellyfin

[Install]
WantedBy=multi-user.target
UNIT

echo "==> Enable and start Jellyfin service"
sudo systemctl daemon-reload
sudo systemctl enable jellyfin-docker
sudo systemctl start jellyfin-docker

echo "==> Done."
echo "Visit: http://<VM_IP>:8096  (HTTP)."
echo "Media folder is: ${MNT}/media"
echo "Config is: ${MNT}/jellyfin/config  (persists across reboots)"
