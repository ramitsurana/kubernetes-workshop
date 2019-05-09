# kubernetes-workshop

![k8s](k8s-logo.png)

Kubernetes Worksphop Material

* [Level 01 - Introduction to Kubernetes](kubernetes-resources/level-01/README.md)
* [Level 02 - Using Helm](kubernetes-resources/level-02/README.md)
* [Level 03 - Building Serverless apps using Kubeless](kubernetes-resources/level-03/README.md)

## Known Minikube configurations

```
# Configure Minikube for 4GB RAM

minikube stop
VBoxManage modifyvm "minikube" --cpus 4 --memory 8196
minikube start --memory=8196 --cpus=4
```

## References:
* https://github.com/GoogleCloudPlatform/kubernetes-workshops/blob/master/core-concepts/local.md
* https://kubernetes.io/docs/concepts/overview/components/
