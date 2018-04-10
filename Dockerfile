FROM ubuntu:xenial
MAINTAINER oliver@weichhold.com

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.17.2.0/s6-overlay-amd64.tar.gz \
    https://github.com/RavenProject/Ravencoin/releases/download/v0.15.99.0/ubuntu16.04-x86_64.tar.gz /tmp/

RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && \
    apt-get update -y && apt-get install software-properties-common -y && \
    add-apt-repository ppa:bitcoin/bitcoin && apt-get update -y && \
    apt-get install -y --no-install-recommends libzmq5 libboost1.58-all-dev libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libevent-pthreads-2.0-5 libevent-2.0-5 && \
    cd /tmp && tar xvf ubuntu16.04-x86_64.tar.gz && cp -r /tmp/ubuntu*/* /usr/bin && \
    rm -rf /usr/share/man/* /usr/share/groff/* /usr/share/info/* /var/cache/man/* /tmp/* /var/lib/apt/lists/*

EXPOSE 16001 16002 16003

ENTRYPOINT ["/init"]
VOLUME ["/data"]
ADD rootfs /
