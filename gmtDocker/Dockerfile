FROM ubuntu:16.04

LABEL maintainer="Jimmy Huang <jimmy60504@gmail.com>"

# GMT install inspired by GMT wiki 
# http://gmt.soest.hawaii.edu/projects/gmt/wiki/installing

# Dockerfile inspired by Tensorflow 
# https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/docker/Dockerfile

# Ubuntu Taiwan NCHC Mirror
RUN sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' \
	/etc/apt/sources.list

# GMT dependencies

RUN apt-get update && apt-get install -y --no-install-recommends \
        gmt \
	gmt-dcw \
	gmt-gshhg \
        && \
    apt-get clean && \
rm -rf /var/lib/apt/lists/*

WORKDIR /


