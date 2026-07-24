Yes — DNS can still work after the bread website moves into a Kubernetes pod.

The path becomes:

```
bread.keyescloudsolutions.com         
		↓
Route53 A record        
		↓
Kubernetes node public IP
        ↓
NodePort Service
         ↓
Bread website pod
```

For Thursday, use this simple plan:

```
1. Start Kubernetes master + workers
2. Copy bread website files to master
3. Build Docker image on master
4. Create Kubernetes Deployment
5. Create NodePort Service
6. Point Route53 to the public IP of one worker/master node
```

Example Kubernetes service:

```
apiVersion: v1
kind: Service
metadata:  
	name: bread-service
spec:  
	type: NodePort  
	selector:    
		app: bread  
	ports:    
		- port: 80      
		targetPort: 80      
		nodePort: 30080
```

Then DNS points to:

```
http://bread.keyescloudsolutions.com:30080
```

Better later:

```
Route53 → LoadBalancer/Ingress → Service → Pod
```

But for your lab, **NodePort is easiest**.

Important: Route53 does **not** point to the pod IP. Pod IPs change. Route53 points to the **node public IP**, and Kubernetes sends traffic to the pod.
