############################################
# version : private.docker.hub:5000/jdk7:v1
# desc : 当前版本安装的jdk7
############################################
# 设置继承自我们创建的 tools 镜像
FROM private.docker.hub:5000/ubuntu:container

# 下面是一些创建者的基本信息
MAINTAINER LiuJQ

ENV REDIS_HOME /usr/local

# 本地的redis源码包复制到镜像的根路径下，ADD命令会在复制过后自动解包。
# 被复制的对象必须处于Dockerfile同一路径，且ADD后面必须使用相对路径
ADD redis-4.0.1.tar.gz /
#创建安装目录
RUN mkdir -p $REDIS_HOME/redis
# 将一开始编译产生并修改后的配置复制到安装目录
ADD redis-4.0.1/redis.conf $REDIS_HOME/redis/

RUN yum -y update

RUN yum install -y gcc make

WORKDIR /redis-4.0.1
RUN make
RUN mv /redis-4.0.1/src/redis-server  $REDIS_HOME/redis/   # 编译后，容器中只需要可执行文件redis-server
 
WORKDIR /
RUN rm -rf /redis-4.0.1          # 删除解压文件
 
RUN yum remove -y gcc make   # 安装编译完成之后，可以删除多余的gcc跟make
 
VOLUME ["/var/log/redis"]  # 添加数据卷
 
# 执行supervisord来同时执行多个命令，
#使用 supervisord 的可执行路径启动服务。
CMD ["/usr/bin/supervisord"]

# 容器需要开放Redis 6379端口
EXPOSE 6379

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server", "/redis/config/redis.conf", "--protected-mode", "no"]
