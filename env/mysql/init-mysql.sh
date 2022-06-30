#!/bin/sh -x

create_database_and_user() {
    DB=$1
    USER=$2
    PASSWORD=$3

    mysql --user root --password=$MYSQL_ROOT_PASSWORD <<EOS
CREATE DATABASE IF NOT EXISTS ${DB};
CREATE USER IF NOT EXISTS  '${USER}'@'%' IDENTIFIED BY '${PASSWORD}';
GRANT ALL ON ${DB}.* TO '${USER}'@'%';
EOS
}

create_database_and_user director director ${ICINGA_DIRECTOR_MYSQL_PASSWORD}
create_database_and_user icingadb icingadb ${ICINGADB_MYSQL_PASSWORD}
create_database_and_user icingaweb icingaweb ${ICINGAWEB_MYSQL_PASSWORD}
