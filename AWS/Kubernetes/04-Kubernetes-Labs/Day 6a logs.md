

ubuntu@k8s-master:~$ kubectl logs -n ingress-nginx deployment/ingress-nginx-controller
-------------------------------------------------------------------------------
NGINX Ingress controller
  Release:       v1.15.1
  Build:         0df02f2cfcf5fe4ad3cf31492bca770ac2a1606a
  Repository:    https://github.com/kubernetes/ingress-nginx
  nginx version: nginx/1.27.1

-------------------------------------------------------------------------------

W0524 17:55:52.346140       7 client_config.go:682] Neither --kubeconfig nor --master was specified.  Using the inClusterConfig.  This might not work.
I0524 17:55:52.346374       7 main.go:205] "Creating API client" host="https://10.96.0.1:443"
I0524 17:55:52.352271       7 main.go:248] "Running in Kubernetes cluster" major="1" minor="30" git="v1.30.14" state="clean" commit="9e18483918821121abdf9aa82bc14d66df5d68cd" platform="linux/amd64"
I0524 17:55:52.396034       7 main.go:101] "SSL fake certificate created" file="/etc/ingress-controller/ssl/default-fake-certificate.pem"
I0524 17:55:52.405787       7 ssl.go:535] "loading tls certificate" path="/usr/local/certificates/cert" key="/usr/local/certificates/key"
I0524 17:55:52.417619       7 nginx.go:273] "Starting NGINX Ingress controller"
I0524 17:55:52.427360       7 event.go:377] Event(v1.ObjectReference{Kind:"ConfigMap", Namespace:"ingress-nginx", Name:"ingress-nginx-controller", UID:"c526f8e3-5bab-4c28-9301-71b1559636b5", APIVersion:"v1", ResourceVersion:"32987", FieldPath:""}): type: 'Normal' reason: 'CREATE' ConfigMap ingress-nginx/ingress-nginx-controller
I0524 17:55:53.620561       7 nginx.go:319] "Starting NGINX process"
I0524 17:55:53.620723       7 leaderelection.go:258] "Attempting to acquire leader lease..." lock="ingress-nginx/ingress-nginx-leader"
I0524 17:55:53.623155       7 nginx.go:339] "Starting validation webhook" address=":8443" certPath="/usr/local/certificates/cert" keyPath="/usr/local/certificates/key"
I0524 17:55:53.623758       7 controller.go:217] "Configuration changes detected, backend reload required"
I0524 17:55:53.631170       7 leaderelection.go:272] "Successfully acquired lease" lock="ingress-nginx/ingress-nginx-leader"
I0524 17:55:53.633837       7 status.go:85] "New leader elected" identity="ingress-nginx-controller-d6f5f6d89-9trwj"
I0524 17:55:53.683152       7 controller.go:231] "Backend successfully reloaded"
I0524 17:55:53.683326       7 controller.go:243] "Initial sync, sleeping for 1 second"
I0524 17:55:53.683718       7 event.go:377] Event(v1.ObjectReference{Kind:"Pod", Namespace:"ingress-nginx", Name:"ingress-nginx-controller-d6f5f6d89-9trwj", UID:"ef0e2dd4-03f9-4245-9f16-93eaf2983218", APIVersion:"v1", ResourceVersion:"33031", FieldPath:""}): type: 'Normal' reason: 'RELOAD' NGINX reload triggered due to a change in configuration
I0524 18:07:49.225824       7 main.go:107] "successfully validated configuration, accepting" ingress="default/web-ingress"
I0524 18:07:49.232365       7 store.go:443] "Found valid IngressClass" ingress="default/web-ingress" ingressclass="nginx"
I0524 18:07:49.232893       7 event.go:377] Event(v1.ObjectReference{Kind:"Ingress", Namespace:"default", Name:"web-ingress", UID:"617bd317-d1c0-4586-ab6d-f3f44d19394c", APIVersion:"networking.k8s.io/v1", ResourceVersion:"34272", FieldPath:""}): type: 'Normal' reason: 'Sync' Scheduled for sync
I0524 18:07:49.233669       7 controller.go:217] "Configuration changes detected, backend reload required"
I0524 18:07:49.280133       7 controller.go:231] "Backend successfully reloaded"
I0524 18:07:49.280947       7 event.go:377] Event(v1.ObjectReference{Kind:"Pod", Namespace:"ingress-nginx", Name:"ingress-nginx-controller-d6f5f6d89-9trwj", UID:"ef0e2dd4-03f9-4245-9f16-93eaf2983218", APIVersion:"v1", ResourceVersion:"33031", FieldPath:""}): type: 'Normal' reason: 'RELOAD' NGINX reload triggered due to a change in configuration