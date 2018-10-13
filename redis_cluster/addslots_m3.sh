# node3 192.168.10.52    172.17.0.4
n=10923
for ((i=n;i<=16383;i++))
do
   #docker exec -it redism1 redis-cli -h 192.168.1.102 -p 6579 -a 123456 CLUSTER ADDSLOTS $i
   docker exec -it redism2 redis-cli -h private.redis.cluster -p 6479 -a 123456 CLUSTER ADDSLOTS $i
done