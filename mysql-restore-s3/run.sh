#!/bin/sh

set -eo pipefail

if [ "${S3_S3V4}" = "yes" ]; then
    aws configure set default.s3.signature_version s3v4
fi

if [ "${SCHEDULE}" = "**None**" ]; then
  sh restore.sh
else
  echo "$SCHEDULE /bin/sh /restore.sh" > /etc/crontabs/root
  exec crond -d 8 -f
fi
