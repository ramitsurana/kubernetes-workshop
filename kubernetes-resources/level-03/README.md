# Level 03 - Building Serverless apps using Kubeless

*  [Language Support](#language-support)
*  [Run Kubeless](#run-kubeless)
*  [Basics](#basics)
*  [Trigger HTTP Functions](#trigger-http-functions)

## Languages Support

* ballerina
* dotnetcore
* Golang
* java
* jvm
* nodejs
* php
* Python
* Ruby

## Run Kubeless

```
$ export RELEASE=$(curl -s https://api.github.com/repos/kubeless/kubeless/releases/latest | grep tag_name | cut -d '"' -f 4)
$ kubectl create ns kubeless
$ kubectl create -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml
$ kubectl get pods -n kubeless
```

The above steps does the following:
1. Checks the version for Kubeless
2. Creates the namespace kubeless
3. Creates 3 pods in the namespace (kubeless)
- cronjobtriggers.kubeless.io
- functions.kubeless.io
- httptriggers.kubeless.io

## Basics

### Deploy Functions

```
kubeless function deploy hello --runtime python3.6 \
                                --dependencies /Users/ramitsurana/Projects/personal/kubernetes-workshop/kubernetes-resources/level-03/requirements.txt \
                                --from-file /Users/ramitsurana/Projects/personal/kubernetes-workshop/kubernetes-resources/level-03/server.py \
                                --handler server.hello

# update function
kubeless function update hello --runtime python3.6 \
                                --dependencies /Users/ramitsurana/Projects/personal/kubernetes-workshop/kubernetes-resources/level-03/requirements.txt \
                                --from-file /Users/ramitsurana/Projects/personal/kubernetes-workshop/kubernetes-resources/level-03/server.py \
                                --handler server.hello
```

### List Functions

```
kubectl get functions

kubeless function ls
```

### Invoke Function

```
kubeless function call hello --data 'Ramit'
```

### Teardown

```
kubeless function delete hello
kubectl delete -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml
```

## Trigger HTTP Functions

```
minikube addons enable ingress

# To Check
kubectl get pod -n kube-system -l app=nginx-ingress-controller
```

```
kubeless trigger http create hello --function-name hello
kubectl get ing
```

* Using Domain Name

```
kubeless trigger http create hello --function-name hello --path echo --hostname rean-pune-office.com
```

* Test Function

```
$ curl --data '{"Another": "Echo"}' \
  --header "Host: hello.192.168.99.100.nip.io" \
  --header "Content-Type:application/json" \
  192.168.99.100/echo
```
## References

* https://kubeless.io/docs/quick-start/
* https://kubeless.io/docs/runtimes/
* https://github.com/kubeless/kubeless/blob/master/docs/http-triggers.md