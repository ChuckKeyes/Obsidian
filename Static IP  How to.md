
### 1) Make the static IP “undeletable” in Terraform

Add `prevent_destroy` so a destroy won’t release it:

*resource "google_compute_address" "ip_media" {*
  *name   = "ip-media"*
  *region = var.region*

  *lifecycle {*
    *prevent_destroy = true*
  *}*
*}*
Now `terraform destroy` will fail if it tries to delete the IP, protecting it from accidental release.

### 2) Rebuild VMs without touching the IP

Instead of nuking everything:

- Recreate just the VM:
*terraform destroy -target=google_compute_instance.media*
*terraform apply*
### 3) Double-check the VM is bound to the reserved IP

*Your instance must point to the address:*
*network_interface {*
  *subnetwork = google_compute_subnetwork.subnet.id*
  *access_config {*
    *nat_ip = google_compute_address.ip_media.address*
  *}*
*}*
### 4) (Optional but recommended) Use DNS so IP changes don’t hurt

Point a DNS A record (e.g., `media.your-domain.com`) at the static IP. Then—even if you _do_ change IPs someday—you only update DNS, not everyone’s bookmarks.
### 5) FYI on billing

A reserved external IP that’s **not attached** to a VM has a small hourly charge. Attached = no extra charge beyond normal egress.

If you want, I can also show you how to split your stack into layers (e.g., **network** state: VPC, subnets, addresses; **compute** state: VMs). That way `destroy` on compute never touches the static IP or network.