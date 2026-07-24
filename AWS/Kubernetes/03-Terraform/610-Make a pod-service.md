Step 1 - Create a working folder

On k8s-master:

mkdir -p ~/k8s-labs/day10-bread
cd ~/k8s-labs/day10-bread

Step 2 - Create deployment.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: bread-website
spec:
  replicas: 3
  selector:
    matchLabels:
      app: bread
  template:
    metadata:
      labels:
        app: bread
    spec:
      containers:
      - name: bread
        image: nginx:latest
        ports:
        - containerPort: 80


Apply it:

kubectl apply -f deployment.yaml

Check it:

kubectl get deployments
kubectl get pods -o wide

Step 3 - Create service.yaml

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

    Apply it:

    kubectl apply -f service.yaml

    Verify:
    kubectl get svc

    NAME            TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
bread-service   NodePort    10.101.236.237   <none>        80:30080/TCP   12s
kubernetes      ClusterIP   10.96.0.1        <none>        443/TCP        54m

Step 4 - Test it

http://52.45.220.77:30080

or either worker:

http://34.232.176.252:30080

http://3.216.130.14:30080

You should see the default Welcome to nginx! page.