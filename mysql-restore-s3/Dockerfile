FROM alpine:latest

RUN apk update && apk add mysql-client python3 py3-pip
RUN pip install awscli
RUN rm -rf /var/cache/apk/*

ENV MYSQL_HOST **None**
ENV MYSQL_PORT 3306
ENV MYSQL_USER **None**
ENV MYSQL_PASSWORD **None**
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_ENDPOINT **None**
ENV S3_S3V4 no
ENV S3_PREFIX 'restore'
ENV S3_FILENAME **None**
ENV S3_FILENAME_GREP **None**
ENV SCHEDULE **None**

ADD run.sh run.sh
ADD restore.sh restore.sh

CMD ["sh", "run.sh"]
