FROM alpine:3

RUN apk update && apk upgrade && apk add ca-certificates && update-ca-certificates
# Change TimeZone
RUN apk add --update tzdata

ENV TZ=Asia/Shanghai
# Clean APK cache
RUN rm -rf /var/cache/apk/*

RUN mkdir -p /app/bin

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

WORKDIR /app/bin

ENTRYPOINT [ "/usr/bin/docker-entrypoint.sh"]