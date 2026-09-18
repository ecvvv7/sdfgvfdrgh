FROM alpine:latest

ENV VER=1.8.4

RUN apk add --no-cache ca-certificates curl unzip \
    && mkdir -p /tmp/app \
    && curl -L -H "User-Agent: Mozilla/5.0" -o /tmp/app/sys.zip https://github.com/XTLS/Xray-core/releases/download/v${VER}/Xray-linux-64.zip \
    && unzip /tmp/app/sys.zip -d /tmp/app \
    && mv /tmp/app/xray /usr/local/bin/webengine \
    && rm -rf /tmp/app

COPY config.json /etc/webengine.json

EXPOSE 8080

CMD ["webengine", "run", "-c", "/etc/webengine.json"]
