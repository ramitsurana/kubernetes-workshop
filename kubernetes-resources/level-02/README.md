# Level 02 - Using Helm

* [Basics](#basics)
* [Helm Hub](#helm-hub)

# Basics

## Create a Chart
```
helm create hello-world
```

* **Chart.yaml**: This is the main file that contains the description of our chart

* **values.yaml**: this is the file that contains the default values for our chart

* **templates**: This is the directory where Kubernetes resources are defined as templates

* **charts**: This is an optional directory that may contain sub-charts

* **.helmignore**: This is where we can define patterns to ignore when packaging (similar in concept to .gitignore)


## Checkout values.yml

```
replicaCount: 1
image:
  repository: "nginx"
  tag: "1.0"
  pullPolicy: IfNotPresent
service:
  type: NodePort
  port: 80
```

##  Check Linting for all your chart
```
helm lint ./hello-world
```

## Render Helm Template locally

```
helm template ./hello-world
```

## Install the charts on local cluster

```
helm install --name hello-world ./hello-world
```

## Check Helm Charts
```
helm ls --all
```

## Upgrade Helm Charts

```
helm upgrade hello-world ./hello-world
```

## Rollback for Helm Chart

```
helm rollback hello-world 1 # 1 is the version
```

## Package 

```
helm package ./hello-world/
```

## Teardown Helm Chart

```
helm delete --purge hello-world
```

# Helm Hub

Checkout [Helm Hub](https://hub.helm.sh/).

## Add Repo

```
helm repo add bitnami https://charts.bitnami.com
```

## Install Wordpress Chart

### Installation
```
helm install bitnami/wordpress --version 5.9.1
```

```
NOTES:
1. Get the WordPress URL:

  NOTE: It may take a few minutes for the LoadBalancer IP to be available.
        Watch the status with: 'kubectl get svc --namespace default -w esteemed-greyhound-wordpress'
  export SERVICE_IP=$(kubectl get svc --namespace default esteemed-greyhound-wordpress --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
  echo "WordPress URL: http://$SERVICE_IP/"
  echo "WordPress Admin URL: http://$SERVICE_IP/admin"

2. Login with the following credentials to see your blog

  echo Username: user
  echo Password: $(kubectl get secret --namespace default esteemed-greyhound-wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode)
```

## Check the Service

```
** WARNING: Use https:// instead of http:// 
https://192.168.99.100:30755/
```
