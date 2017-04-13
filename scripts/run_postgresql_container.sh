#!/bin/bash

docker rm -f gogs_postgresql

#docker run -d \
#   --name gogs_postgres \
#   -e POSTGRES_DB=gogs \
#   -e POSTGRES_USER=gogs \
#   -e POSTGRES_PASSWORD=test01 \
#   -p 5432:5432 \
#   -v $(pwd)/var_lib_postgresql:/var/lib/postgresql \
#   postgres:9.6.2


docker run --name=gogs_postgresql -d \
  --env='DB_NAME=gogs' \
  --env='DB_USER=gogs' --env='DB_PASS=test01' \
  --volume=$(pwd)/var_lib_postgresql:/var/lib/postgresql \
  sameersbn/postgresql:9.6-2

sleep 5

docker exec -ti gogs_postgresql psql -U gogs gogs
