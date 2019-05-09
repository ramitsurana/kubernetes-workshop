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

### Pods

```
kubectl create -f ./deploy-manifest.yml
```

### Service

```
kubectl get svc lobsters -o yaml | grep nodePort
```

### RC

```
kubectl create -f ./rc.yaml
kubectl get pods -o wide
```

###  Kill the Pod

```
kubectl delete pod <POD_NAME> 
kubectl get pods -o wide
```
```
kubectl scale --replicas=5 rc <RC_NAME>
kubectl get rc <RC_NAME> -o wide
```

### Deployments

```
kubectl create -f ./dep.yaml
kubectl get rs -o wide
kubectl apply -f ./dep-2.yaml
```


### Teardown

```
kubectl delete pod,rc,svc,deployment,ns -l app=kickstart-app
```