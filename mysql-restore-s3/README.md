# mysql-restore-s3

Restore MySQL to S3 (supports periodic restore)

## Basic usage

```sh
$ docker run \ 
  -e S3_ACCESS_KEY_ID=key \ 
  -e S3_SECRET_ACCESS_KEY=secret \
  -e S3_BUCKET=my-bucket \
  -e S3_PREFIX=backup \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=password \
  -e MYSQL_HOST=localhost \
  -e SCHEDULE="@weekly"
  keltuo/mysql-restore-s3
```

```sh
$ docker-compose --env-file ./.env_docker-compose up -d --remove-orphans
```



## Environment variables

- `MYSQL_HOST` the mysql host *required*
- `MYSQL_PORT` the mysql port (default: 3306)
- `MYSQL_USER` the mysql user *required*
- `MYSQL_PASSWORD` the mysql password *required*
- `S3_ACCESS_KEY_ID` your AWS access key *required*
- `S3_SECRET_ACCESS_KEY` your AWS secret key *required*
- `S3_BUCKET` your AWS S3 bucket path *required*
- `S3_PREFIX` path prefix in your bucket (default: 'backup')
- `S3_FILENAME` a consistent filename to overwrite with your backup.  If not set will use a timestamp.
- `S3_REGION` the AWS S3 bucket region (default: us-west-1)
- `S3_ENDPOINT` the AWS Endpoint URL, for S3 Compliant APIs such as [minio](https://minio.io) (default: none)
- `S3_S3V4` set to `yes` to enable AWS Signature Version 4, required for [minio](https://minio.io) servers (default: no)
- `SCHEDULE` backup schedule time, see explainatons below

### Automatic Periodic Backups

You can additionally set the `SCHEDULE` environment variable like `-e SCHEDULE="@weekly"` to run the backup automatically.

More information about the scheduling can be found [here](http://godoc.org/github.com/robfig/cron#hdr-Predefined_schedules).

### Credits 
https://github.com/csabasulyok/dockerfiles/tree/cs-mysql-restore-s3