# 创建redis集群（前3个是master节点，后3个是slave节点）
redis-trib.rb create --replicas 1 172.22.0.2:6379 172.22.0.3:6379 172.22.0.4:6379 172.22.0.5:6379 172.22.0.6:6379 172.22.0.7:6379

1.
docker stop redis_server && docker rm redis_server

2.
docker run -itd --user redis -p 6379:6379 \
-v /data/vol/redis/data:/redis/data \
-v /data/vol/redis/config:/redis/config \
-v /data/vol/redis/logs:/redis/logs \
--name redis_server private.docker.hub:5000/redis:3.2.8-sever


docker run -itd --user redis -p 6379:6379 \
--name redis_server private.docker.hub:5000/redis:3.2.8-sever

3.
COMPOSE_PROJECT_NAME=test docker-compose up -d

4.
docker inspect redism1 redism2 redism3 rediss1 rediss2 rediss3 | grep \"IPAddress\"| grep 172

docker inspect redism1 redism2 redism3 rediss1 rediss2 rediss3 | grep IPA

5.

docker exec -it redism1 redis-cli -h private.tx.master -p 6379
CLUSTER MEET 172.22.0.2 6379

docker exec -it redism1 redis-cli -h 192.168.1.101 -p 6379

6.分配槽 addslots.sh

7.增加ha addSlaveNodes.sh

8.镜像制作
$ docker commit -m "redis cluster sigle" -a "LiuJQ" rediss2  private.docker.hub:5000/rediss2:v0.1
$ docker commit -m "redis cluster sigle" -a "LiuJQ" rediss1  private.docker.hub:5000/rediss1:v0.1
$ docker commit -m "redis cluster sigle" -a "LiuJQ" rediss3  private.docker.hub:5000/rediss3:v0.1
$ docker commit -m "redis cluster sigle" -a "LiuJQ" redism2  private.docker.hub:5000/redism2:v0.1
$ docker commit -m "redis cluster sigle" -a "LiuJQ" redism1  private.docker.hub:5000/redism1:v0.1
$ docker commit -m "redis cluster sigle" -a "LiuJQ" redism3  private.docker.hub:5000/redism3:v0.1
$ docker images |grep v0.1


docker run -itd --user redis -p 6379:6379 \
--name redis_server private.docker.hub:5000/redis:3.2.8-sever


docker exec -it redism1 redis-cli -c -h private.docker.hub  -p 6579
