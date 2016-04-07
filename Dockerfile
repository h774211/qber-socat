FROM alpine:3.3

RUN apk --update add socat && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/socat"]
