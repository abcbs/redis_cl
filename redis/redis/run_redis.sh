docker run -itd --user redis -p 6379:6379 \
-v /Users/yunyu/workspace_git/birdDocker/redis/data:/redis/data \
-v /Users/yunyu/workspace_git/birdDocker/redis/config:/redis/config \
-v /Users/yunyu/workspace_git/birdDocker/redis/logs:/redis/logs \
--name redis_redis birdben/redis:v2


