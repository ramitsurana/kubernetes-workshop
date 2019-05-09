# Level 01 - Introduction to kubernetes/minikube

* [Minikube Commands](#minikube-commands)
* [Kubernetes Commands](#kubernetes-commands)

## Minikube Commands

### Check Service from browser

```
minikube service nginx
minikube service nginx --url=true
```

### UI Dashboard

```
minikube dashboard
```

### Running via localhost

```
kubectl proxy
```

## Kubernetes Commands

## Manifest Commands

```
kubectl create -f ./deploy-manifest.yaml
kubectl apply -f ./deploy-manifest.yaml # Upgrade
kubectl delete -f ./deploy-manifest.yaml
```

### More CLI Commands

```
kubectl get pods -o wide
kubectl get svc lobsters -o yaml
kubectl get pods --show-labels
kubectl delete pod <POD_NAME>
kubectl scale --replicas=5 rc <RC_NAME>
```

* Troubleshooting

```
# In case service is to be created
kubectl create svc nodeport sample --tcp=8080:8080
```
### Teardown

```
kubectl delete pod,rc,svc,deployment,ns -l app=kickstart-app
```