FROM rossja/docktor:latest

EXPOSE 8118 9050

RUN apk add --upgrade apk-tools@edge && \
    echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && \
    apk add privoxy tor@testing runit@testing

COPY service /etc/service/

CMD ["runsvdir", "/etc/service"]
