FROM alpine:latest
MAINTAINER imcat

RUN apk add --update \
    p7zip unrar unzip curl wget tar transmission-cli \
    transmission-daemon \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /temp && cd /temp \
    && wget https://github.com/ronggang/transmission-web-control/archive/master.zip \
    && unzip master.zip \
    && cd transmission-* \
    && mv /usr/share/transmission/web/index.html /usr/share/transmission/web/index.original.html \
    && cp -r src/. /usr/share/transmission/web/ \
    && cd / && rm -rf /temp	
	
RUN mkdir -p /transmission/downloads \
  && mkdir -p /transmission/incomplete \
  && mkdir -p /etc/transmission-daemon

VOLUME ["/etc/transmission-daemon"]
VOLUME ["/transmission/downloads"]
VOLUME ["/transmission/incomplete"]

EXPOSE 9091 51413/tcp 51413/udp

ENV USERNAME admin
ENV PASSWORD password

RUN chmod +x /start-transmission.sh
CMD ["/start-transmission.sh"]
