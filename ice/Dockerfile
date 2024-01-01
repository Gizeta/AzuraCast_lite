FROM alpine:3.19

WORKDIR /opt/ice

RUN apk update && apk add ices icecast

COPY main.sh .

RUN adduser -D ice && chown -R 1000:1000 /opt/ice

USER ice

EXPOSE 8020

CMD ["/opt/ice/main.sh"]
