# mysql-dump

Dumping MySQL for backup

## Basic usage

### Environment variables

- `MYSQL_HOST` the mysql host *required*
- `MYSQL_PORT` the mysql port (default: 3306)
- `MYSQL_USER` the mysql user *required*
- `MYSQL_PASSWORD` the mysql password *required*
- `MYSQL_DATABASE` the mysql database *required*
- `CUSTOM_FILENAME` the filename (default: $(date +"%s_%Y-%m-%d")_${MYSQL_DATABASE}.sql)

.env-dump
```dotenv
PROJECT_NAME=my-project

MYSQL_HOST=mariadb
MYSQL_USER=root
MYSQL_PASSWORD=root
MYSQL_DATABASE=mydb

```
### Docker
```sh
$ touch .env-dump
$ mkdir backup
$ docker run --rm --env-file ./.env-dump -v $(pwd)/backup:/backup keltuo/mysql-dump 
```
###Docker without env file
```sh
$ mkdir backup
$ docker run --rm \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=password \
  -e MYSQL_HOST=localhost \
  -e MYSQL_DATABASE=mydb \
  -v $(pwd)/backup:/backup \
  keltuo/mysql-dump
```
