master  = 18.216.63.42
worker1 = 3.15.197.4
worker2 = 3.19.222.156
DNS     = kubernetes.keyescloudsolutions.com

SSH into the master:

ssh -i ~/.ssh/id_rsa ubuntu@18.216.63.42

Then check the setup script finished:

systemctl status containerd --no-pager

Now SSH into each worker and check the same:

ssh -i ~/.ssh/id_rsa ubuntu@3.15.197.4
systemctl status containerd --no-pager
exit
ssh -i ~/.ssh/id_rsa ubuntu@3.19.222.156
systemctl status containerd --no-pager
exit
