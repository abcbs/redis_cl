############################################
# version: private.docker.hub:5000/redis:3.2.8
# desc : 当前版本安装的redis
############################################
# 设置继承自我们创建的 tools 镜像
FROM private.docker.hub:5000/redis:3.2.8
MAINTAINER LiuJQ


# 设置环境变量，所有操作都是非交互式的
ENV DEBIAN_FRONTEND noninteractive


RUN set -x \
	&& mkdir -p /redis/data \
	&& mkdir -p /redis/config \
	&& mkdir -p /redis/logs \
	&& chown -R redis:redis /redis/data \
	&& chown -R redis:redis /redis/config \
	&& chown -R redis:redis /redis/logs

# 复制docker-entrypoint.sh脚本到/usr/local/bin目录下
COPY docker-entrypoint.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY config/redis.conf /redis/config/redis.conf

VOLUME /redis/data
VOLUME /redis/config
VOLUME /redis/logs

# 容器需要开放Redis 6379端口
EXPOSE 6379

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["redis-server", "/redis/config/redis.conf", "--protected-mode", "no"]