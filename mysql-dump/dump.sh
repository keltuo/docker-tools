#!/bin/sh

set -eo pipefail

if [ "${MYSQL_HOST}" == "**None**" ]; then
  echo "You need to set the MYSQL_HOST environment variable."
  exit 1
fi

if [ "${MYSQL_USER}" == "**None**" ]; then
  echo "You need to set the MYSQL_USER environment variable."
  exit 1
fi

if [ "${MYSQL_PASSWORD}" == "**None**" ]; then
  echo "You need to set the MYSQL_PASSWORD environment variable or link to a container named MYSQL."
  exit 1
fi


if [ "${MYSQL_DATABASE}" == "**None**" ]; then
  echo "You need to set the MYSQL_DATABASE environment variable or link to a container named MYSQL."
  exit 1
fi

DB_PASSWORD=$(echo ${MYSQL_PASSWORD} | tr -d '"')

MYSQL_HOST_OPTS="${MYSQL_OPTS} -h $MYSQL_HOST -P $MYSQL_PORT -u$MYSQL_USER -p$DB_PASSWORD"

echo "Dumping database ${MYSQL_DATABASE} for user ${MYSQL_USER}"

now=$(date +"%s_%Y-%m-%d")

/usr/bin/mysqldump --opt $MYSQL_HOST_OPTS ${MYSQL_DATABASE} > "/backup/${now}_${MYSQL_DATABASE}.sql"

echo "MySQL Dump complete"
