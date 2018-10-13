#!/bin/bash
# node1 192.168.10.52   172.17.0.2
n=0
for ((i=n;i<=5461;i++))
do
     docker exec -it redism1 redis-cli -h 192.168.1.102 -p 6379 -a 123456  CLUSTER ADDSLOTS $i
done
 
 
# node2 192.168.10.52    172.17.0.3
n=5462
for ((i=n;i<=10922;i++))
do
   docker exec -it redism1 redis-cli  -h 192.168.1.102 -p 6479 -a 123456 CLUSTER ADDSLOTS $i
done
 
 
# node3 192.168.10.52    172.17.0.4
n=10923
for ((i=n;i<=16383;i++))
do
   docker exec -it redism1 redis-cli -h 192.168.1.102 -p 6579 -a 123456 CLUSTER ADDSLOTS $i
done