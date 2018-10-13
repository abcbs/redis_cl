#!/bin/bash
eec3d445a5c499e5c9a7dfeed24e68e948d0a1ed 172.22.0.3:6379 master - 0 1536591759784 0 connected 5462-10922
85a03ce6feb984905a34829028f82fa06a4c18e1 172.22.0.6:6379 master - 0 1536591756715 4 connected
9edc95e9a07b3045fe3d6edfde45d9ef4f882cf8 172.22.0.5:6379 master - 0 1536591761821 3 connected
43358645e708ac42195063d1260a39186c9b7d04 172.22.0.2:6379 myself,master - 0 0 1 connected 0-5461
224d22724f96ee8a36ec43849f464f8ef137c34b 172.22.0.4:6379 master - 0 1536591760802 2 connected 10923-16383
5ee4a575fd926763af020df6074d6349e2fe10fc 172.22.0.7:6379 master - 0 1536591758766 5 connected
 
 
docker exec -it redism1 redis-cli -h 192.168.1.102 -p 6679 -a 123456 CLUSTER REPLICATE eec3d445a5c499e5c9a7dfeed24e68e948d0a1ed
 
docker exec -it redism1 redis-cli -h 192.168.1.102 -p 6779 -a 123456 CLUSTER REPLICATE 43358645e708ac42195063d1260a39186c9b7d04
 
docker exec -it redism1 redis-cli -h 192.168.1.102 -p 6879 -a 123456 CLUSTER REPLICATE 224d22724f96ee8a36ec43849f464f8ef137c34b

#private.redis.cluster
docker exec -it redism1 redis-cli -h private.redis.cluster -p 6679 -a 123456 CLUSTER REPLICATE eec3d445a5c499e5c9a7dfeed24e68e948d0a1ed
 
docker exec -it redism1 redis-cli -h private.redis.cluster -p 6779 -a 123456 CLUSTER REPLICATE 43358645e708ac42195063d1260a39186c9b7d04
 
docker exec -it redism1 redis-cli -h private.redis.cluster -p 6879 -a 123456 CLUSTER REPLICATE 224d22724f96ee8a36ec43849f464f8ef137c34b