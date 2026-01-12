#!/usr/bin/env bash
set -euo pipefail

DISK_NAME="disk-media-data"
DEVICE="/dev/disk/by-id/google-${DISK_NAME}"
MNT="/mnt/disk-media-data"

echo "==> WARNING: This will ERASE ${DISK_NAME} (${DEVICE}). Ctrl-C now to abort."
sleep 3

# Ensure device exists
if [[ ! -e "${DEVICE}" ]]; then
  echo "ERROR: ${DEVICE} not found. Make sure the PD '${DISK_NAME}' is attached." >&2
  exit 1
fi

# Stop Docker if installed (so the mount isn't busy)
if command -v systemctl >/dev/null 2>&1 && systemctl list-unit-files | grep -q '^docker\.service'; then
  echo "==> Stopping Docker service (if running)"
  systemctl is-active --quiet docker && sudo systemctl stop docker || true
fi

echo "==> Unmounting ${MNT} (if mounted)"
sudo umount "${MNT}" 2>/dev/null || true

echo "==> Making fresh ext4 filesystem on ${DEVICE}"
sudo mkfs.ext4 -F -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard "${DEVICE}"

echo "==> Ensuring mount point exists"
sudo mkdir -p "${MNT}"

echo "==> Mounting fresh filesystem"
sudo mount "${DEVICE}" "${MNT}"

echo "==> Updating /etc/fstab (removing old lines, adding new UUID)"
UUID=$(sudo blkid -s UUID -o value "${DEVICE}")
# backup fstab
sudo cp /etc/fstab /etc/fstab.bak.$(date +%Y%m%d-%H%M%S)
# remove any prior entries for this mountpoint
sudo sed -i '\|/mnt/disk-media-data|d' /etc/fstab
# add the new one
echo "UUID=${UUID}  ${MNT}  ext4  discard,defaults  0  2" | sudo tee -a /etc/fstab >/dev/null

echo "==> Verifying with mount -a"
sudo umount "${MNT}"
sudo mount -a

echo "==> Recreating Jellyfin/Docker folder structure on the clean disk"
sudo mkdir -p "${MNT}/docker" "${MNT}/jellyfin/config" "${MNT}/jellyfin/cache" "${MNT}/media"
sudo chmod -R 755 "${MNT}"

echo "==> Done. Disk '${DISK_NAME}' is wiped and ready."
echo "Next steps:"
echo "  1) Reinstall/start Docker if needed:   sudo apt-get update && sudo apt-get install -y docker.io && sudo systemctl enable --now docker"
echo "  2) Start Jellyfin container (example):"
echo "     sudo docker run -d --name jellyfin -p 8096:8096 -p 8920:8920 \\"
echo "       -v ${MNT}/jellyfin/config:/config -v ${MNT}/jellyfin/cache:/cache -v ${MNT}/media:/media \\"
echo "       --restart unless-stopped jellyfin/jellyfin:latest"
