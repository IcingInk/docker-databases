#! make
ME=$(USER)
TS := $(shell date '+%Y_%m_%d_%H_%M')
MYSQL_DATABASE=cgi
MYSQL_USER=root
MYSQL_PASSWORD=root


all: up

up: 
	docker-compose up -d 
ps: 
	docker-compose ps 

stop:
	docker-compose stop


mysqldump:
	@docker exec mysql-db sh -c 'exec mysqldump ${MYSQL_DATABASE} -u${MYSQL_USER} -p${MYSQL_PASSWORD}' > ./backup/${MYSQL_DATABASE}_${TS}.sql



#docker exec  mysql-db sh -c 'exec mysqldump cgi -uroot -p"$MYSQL_ROOT_PASSWORD"' > /backup/cgi.sql
#docker exec -it mysql-db bash
