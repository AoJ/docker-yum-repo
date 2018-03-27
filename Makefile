NAME ?= aooj/cdh
VERSION ?= 5.13.2
CDH_VERSION ?= 5.13.2
MARIADB_VERSION ?= 10.1


cdh:
    docker build --no-cache --force-rm --build-arg CDH_VERSION=${CDH_VERSION} -t repo-${NAME}:${CDH_VERSION} cdh

mariadb:
    docker build --no-cache --force-rm --build-arg MARIADB_VERSION=${MARIADB_VERSION} -t repo-${NAME}:${MARIADB_VERSION} mariadb


.PHONY: cdh mariadb
