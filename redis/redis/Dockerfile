############################################
# version : private.docker.hub:5000/jdk7:v1
# desc : 当前版本安装的jdk7
############################################
# 设置继承自我们创建的 tools 镜像
FROM private.docker.hub:5000/ubuntu:baseline

# 下面是一些创建者的基本信息
MAINTAINER LiuJQ

ENV REDIS_HOME /usr/local

# 本地的redis源码包复制到镜像的根路径下，ADD命令会在复制过后自动解包。
# 被复制的对象必须处于Dockerfile同一路径，且ADD后面必须使用相对路径
ADD redis-3.2.12/redis.images.tar /
#创建安装目录
RUN mkdir -p $REDIS_HOME/redis 
# 将一开始编译产生并修改后的配置复制到安装目录
ADD config/redis.conf $REDIS_HOME/redis/

VOLUME ["/redis/logs"] 
 


# 容器需要开放Redis 6379端口
EXPOSE 6379

CMD ["redis-server",  "--protected-mode", "no"]
