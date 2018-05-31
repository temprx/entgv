FROM ubuntu:16.04
LABEL maintainer="daoying007 <daoying007@gmail.com>"
LABEL maintainer_ulord_address="UjveZHp4HeE6g4H1SouBjGZuGE2GPjxREW"
LABEL github="https://github.com/daoying007/ulord-node-stratum-pool-docker"

COPY sources-aliyun.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git supervisor build-essential gcc g++ cmake libuv1-dev libmicrohttpd-dev openssl libssl-dev

RUN git clone https://github.com/UlordChain/ulordrig.git \
    && cd ulordrig \
    && mkdir build \
    && cd build \
    && cmake .. \
    && make

ADD etc/supervisor /etc/supervisor/
ADD script /root/
ADD etc/ulordrig/config.json /ulordrig/build/

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]