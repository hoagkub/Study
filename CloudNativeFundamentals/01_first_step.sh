# Create a cluster named mycluster with just a single server node
k3d cluster create mycluster

# Get cluster and add-ons endpoints
kubectl cluster-info

# Show kubectl config - Kubeconfig 
cat $HOME/.kube/config

# Get cluster node 
kubectl get nodes
kubectl get node -o wide

# Describe cluster nodes
kubectl describe node {{ Node Name }}

# create the namespace 
# note: label option is not available with `kubectl create`
kubectl create ns demo

# label the namespace
kubectl label ns demo tier=test

# create the nginx-alpine deployment 
kubectl create deploy nginx-alpine --image=nginx:alpine  --replicas=3 --namespace demo

# label the deployment
kubectl label deploy nginx-alpine app=nginx tag=alpine --namespace demo

# expose the nginx-alpine deployment, which will create a service
kubectl expose deployment nginx-alpine --port=8111 --namespace demo

# create a config map
kubectl create configmap nginx-version --from-literal=version=alpine --namespace demo