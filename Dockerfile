FROM alpine:edge

ADD entrypoint.sh /usr/bin/entrypoint.sh

RUN chmod +x /usr/bin/entrypoint.sh && \
    adduser -D builder && \
    echo "builder ALL=(ALL) ALL" >> /etc/sudoers && \
    addgroup builder abuild && \
    mkdir -p /var/cache/distfiles && \
    chgrp abuild /var/cache/distfiles && \
    chmod g+w /var/cache/distfiles && \
    apk -U add alpine-sdk pax-utils

WORKDIR /home/builder
USER builder
VOLUME ["/home/builder"]

