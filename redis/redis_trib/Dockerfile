############################################
# version : private.docker.hub:5000/redis_trib:v2
# desc : 当前版本安装的redis_trib
############################################
# 设置继承自我们创建的 tools 镜像
FROM private.docker.hub:5000/ruby:latest 

# 下面是一些创建者的基本信息
MAINTAINER LJQ

RUN set -x

ENV PATH /usr/local/rvm/bin:$PATH

RUN set -x \
	&& apt-get update \
	&& apt-get install -y gem \
	&& apt-get install -y rubygems \
	&& gem install redis-3.2.8 \
	&& rm -rf /var/lib/apt/lists/*

# 复制redis-trib.rb脚本到/usr/bin目录下
COPY redis-trib.rb /usr/bin
