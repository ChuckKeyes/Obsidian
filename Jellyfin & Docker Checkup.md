
### 🧩 Step 1 – Check if the container is running

*`sudo docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'`*

- **If you see `jellyfin`** with “Up …” and ports like `0.0.0.0:8096->8096/tcp` → container is alive.
    
- **If it’s empty** → container stopped or Docker isn’t running → go to step 2.
- ### ⚙️ Step 2 – Check Docker itself

*`sudo systemctl status docker --no-pager`*

- **active (running)** → Docker OK
    
- **inactive / failed / not found** → reinstall or restart:
- 
- *sudo apt-get update -y*
*sudo apt-get install -y docker.io*
*sudo systemctl enable --now docker*
###### Then re-run the Jellyfin container manually to verify:
*sudo docker rm -f jellyfin 2>/dev/null || true*
*sudo docker run -d \*
  *--name jellyfin \*
  *-p 8096:8096 -p 8920:8920 \*
  *-v /mnt/disk-media-data/jellyfin/config:/config \*
  *-v /mnt/disk-media-data/jellyfin/cache:/cache \*
  *-v /mnt/disk-media-data/media:/media \*
  *--restart unless-stopped \*
  *jellyfin/jellyfin:latest*
  
###### 📡 Step 3 – Check local connectivity

*ss -lntp | grep 8096 || echo "Nothing listening on 8096"*
*curl -I http://127.0.0.1:8096 || echo "No local response"*
### 📜 Step 4 – Inspect logs

#### a) Container logs
*sudo docker logs jellyfin | tail -n 40*
###### b) App logs (on persistent disk)
*sudo tail -n 40 /mnt/disk-media-data/jellyfin/config/log/jellyfin*.log*
These will show startup errors (e.g., config corruption, missing mount, permission denied, etc.).
### 🧱 Step 5 – Firewall & IP

If Jellyfin works on localhost but not from your PC:
*gcloud compute firewall-rules list --filter="name~jellyfin"*
###### Ensure a rule like:
*allow-jellyfin-admin  tcp:8096  INGRESS  source: <your_ip>/32  targetTags: media*
###### If unsure, temporarily open it to all for testing:
*gcloud compute firewall-rules create allow-jellyfin-test \*
  *--direction=INGRESS --priority=900 \*
  *--network=<your-network-name> --action=ALLOW \*
  *--rules=tcp:8096 --source-ranges=0.0.0.0/0 --target-tags=media*

### Step 6 – If the container keeps dying

###### Look for crash-looping:
*sudo docker ps -a | grep jellyfin*
*sudo docker logs jellyfin | head -n 50*
If it exits repeatedly, we may need to clear or repair `/mnt/disk-media-data/jellyfin/config`.

## This erases everything on 'disk-media-data'

