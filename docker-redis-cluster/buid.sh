docker build --build-arg redis_version=3.2.0 -t private.docker.hub:5000/redis-cluster:v0.1 .
    
create --replicas 1  169.254.32.2:7000  169.254.32.2:7001  169.254.32.2:7002  169.254.32.2:7003  169.254.32.2:7004  169.254.32.2:7005