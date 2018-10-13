# 创建redis集群（前3个是master节点，后3个是slave节点）
redis-trib.rb create --replicas 1 172.22.0.2:6379 172.22.0.3:6379 172.22.0.4:6379 172.22.0.5:6379 172.22.0.6:6379 172.22.0.7:6379



docker run -itd --user redis -p 6379:6379 \
--name redis_server private.docker.hub:5000/redis:3.2.8-sever

3.
COMPOSE_PROJECT_NAME=test docker-compose up -d

4.
docker inspect redism1 redism2 redism3 rediss1 rediss2 rediss3 | grep \"IPAddress\"| grep 172

docker inspect redism1 redism2 redism3 rediss1 rediss2 rediss3 | grep IPA

5.
docker exec -it redism1 redis-cli -h private.tx.master -p 6379

8.使用redis-trib

镜像

创建节点命令：


redis-trib.rb create --replicas 1 172.22.0.2:6379 172.22.0.3:6379 172.22.0.4:6379 172.22.0.5:6379 172.22.0.6:6379 172.22.0.7:6379

redis-trib.rb info  private.tx.master:6379

redis-trib.rb info 172.22.0.3:6379

docker stop redism1 redism2 redism3 rediss1 rediss2 rediss3
docker rm redism1 redism2 redism3 rediss1 rediss2 rediss3 