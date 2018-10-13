docker run -itd -p 26379:6379 \
-v /Users/yunyu/workspace_git/birdDocker/redis_trib/data:/redis/data \
-v /Users/yunyu/workspace_git/birdDocker/redis_trib/config:/redis/config \
-v /Users/yunyu/workspace_git/birdDocker/redis_trib/logs:/redis/logs \
--network rediscluster_redis_net \
--name redis_trib_root private.docker.hub:5000/redis_trib:v1