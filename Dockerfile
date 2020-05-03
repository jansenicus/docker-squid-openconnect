FROM alpine:latest

RUN set -xe \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               sudo squid openconnect w3m\
    && mkdir -p /etc/openconnect
# copy necessary files to container
COPY openconnect.conf /etc/openconnect/openconnect.conf
COPY hipreport.sh /etc/openconnect/hipreport.sh
COPY secret /etc/openconnect/secret
COPY squid.conf /etc/squid/squid.conf
COPY hosts /etc/hosts_extra
# copy and make symbolic link
COPY openconnect_squid.sh /usr/local/bin/openconnect_squid.sh
RUN ln -s  /usr/local/bin/openconnect_squid.sh /
# expose the squid port
EXPOSE 3128/tcp
ENV ip_address=172.17.0.2
ENV squid_port=3128
ENV http_proxy=http://${ip_address}:$(squid_port)
ENV https_proxy=http://${ip_address}:$(squid_port)
ENV ftp_proxy=http://${ip_address}:$(squid_port)
ENTRYPOINT [ "./openconnect_squid.sh" ] 