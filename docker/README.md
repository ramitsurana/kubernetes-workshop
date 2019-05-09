# Docker Sample

* [Objective](#objective)
* [Teardown](#teardown)

## Objective

## Building your First Docker Image 

```
docker build -t <YOUR_USERNAME>/myfirstapp .
docker run -p 8888:5000 --name myfirstapp YOUR_USERNAME/myfirstapp
```

## Docker Login

```
docker login
docker push YOUR_USERNAME/myfirstapp
```

## Teardown

```
docker rm -f myfirstapp
```

## Remove all stoppped containers

```
docker rm $(docker ps -a -q)
```

## References:

* https://github.com/docker/labs/blob/master/beginner/chapters/webapps.md
