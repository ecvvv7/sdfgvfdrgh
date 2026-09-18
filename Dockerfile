FROM alpine:latest

ENV XRAY_VERSION=1.8.4

RUN apk add --no-cat-cache ca-certificates curl unzip \
    && mkdir -p /tmp/xray \
    && curl -L -H "User-Agent: Mozilla/5.0" -o /tmp/xray/xray.zip https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip \
    && unzip /tmp/xray/xray.zip -d /tmp/xray \
    && install -m 755 /tmp/xray/xray /usr/local/bin/xray \
    && rm -rf /tmp/xray

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["xray", "run", "-c", "/etc/xray/config.json"]
