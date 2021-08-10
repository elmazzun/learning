# Mongo Express deploy example

Tested with minikube v1.22.0

ME = Mongo Express

MDB = Mongo DB

## Making and operation on DB

```
Browser -> ME External Service -> ME Pod -> MDB Internal Service -> MDB Pod

```

## DB returning results

```
MDB Pod -> MB Internal Service -> ME Pod -> ME External Service -> Browser
```

## How to run

Order matters.

```
$ kubectl apply -f mongo-configmap.yaml
$ kubectl apply -f mongo-secret.yaml
$ kubectl apply -f mongo.yaml
$ kubectl apply -f mongo-express.yaml
$ ./serve.sh
```
