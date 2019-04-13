# Level 01 - Introduction to kubernetes

## Service
```
kubectl create -f ./service-local.yaml,./pod.yaml
kubectl get svc lobsters -o yaml | grep nodePort
kubectl delete pod,svc -l app=lobsters
```

## RC
```
kubectl create -f ./rc.yaml,./service-local.yaml
kubectl get pods -o wide
```

##  Kill the Pod
```
kubectl delete pod lobsters-jf0xs 
kubectl get pods -o wide
```
```
kubectl scale --replicas=5 rc lobsters
kubectl get rc lobsters -o wide
```

## Deployments
```
kubectl create -f ./dep.yaml,./service-local.yaml
kubectl get rs -o wide
kubectl apply -f ./dep-2.yaml
```


## Teardown
```
kubectl delete pod,rc,svc,deployment -l app=lobsters
```