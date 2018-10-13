
### Create Redis Cluster Configuration

```
kubectl create configmap redis-conf --from-file=redis.conf
```

### Create Redis Services

```
kubectl create -f statefulset-services/redis-headless.yaml
```

### Create Redis Statefulset

```
kubectl create -f statefulset/redis-statefulset.yaml
```

#provied service for extends
kubectl create -f statefulset-services/redis-access.yaml
### Connect Nodes





kubectl delete -f statefulset-services/redis-headless.yaml

kubectl delete -f statefulset/redis-statefulset.yaml

kubectl delete -f persistentvolumeclaims

kubectl delete -f persistentvolume


kubectl delete configmaps "redis-conf"


### Accessing redis cli

Connect to any redis pod
```
kubectl exec -it <podName> -- /bin/bash
```
Access cli
```
/usr/local/bin/redis-cli -c -p 6379
```
To check cluster nodes
```
/usr/local/bin/redis-cli -p 6379 cluster nodes
```
