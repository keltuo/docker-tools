FROM alpine:latest

RUN apk add --no-cache mysql-client

ENV MYSQL_HOST **None**
ENV MYSQL_PORT 3306
ENV MYSQL_USER **None**
ENV MYSQL_PASSWORD **None**
ENV MYSQL_DATABASE **None**
ENV CUSTOM_FILENAME **None**

ADD dump.sh dump.sh

CMD ["sh", "dump.sh"]
