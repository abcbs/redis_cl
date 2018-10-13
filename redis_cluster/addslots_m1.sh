#!/bin/bash
# node1 192.168.10.52   172.17.0.2 private.redis.cluster
n=0
for ((i=n;i<=5461;i++))
do
    #docker exec -it redism2 redis-cli  -h 192.168.1.102 -p 6379 -a 123456 CLUSTER ADDSLOTS $i
    docker exec -it redism1 redis-cli -h private.redis.cluster -p 6379 -a 123456  CLUSTER ADDSLOTS $i
done