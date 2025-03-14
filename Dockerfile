# Minimal Docker image for DecentTree using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install DecentTree
RUN apk update && \
    apk add bash cmake g++ gcc make musl-dev && \
    wget -qO- "https://github.com/iqtree/decenttree/archive/refs/tags/v1.0.0.tar.gz" | tar -zx && \
    cd decenttree-* && \
    cmake . && \
    make && \
    make install && \
    cd .. && \
    rm -rf decenttree-*
