FROM node:alpine

RUN apk add --no-cache curl
RUN apk add --no-cache git

# docker
ENV DOCKER_BUCKET get.docker.com
ENV DOCKER_VERSION 18.06.1-ce

RUN set -x \
	&& curl -fSL "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
	&& tar -xzvf docker.tgz \
	&& mv docker/* /usr/local/bin/ \
	&& rmdir docker \
	&& rm docker.tgz \
	&& docker -v


CMD top