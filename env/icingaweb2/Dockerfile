FROM alpine/git
WORKDIR /
RUN git clone https://github.com/Icinga/icingadb-web.git icingadb

FROM icinga/icingaweb2:master
USER root
RUN apt update \
    && apt install -y composer \
    && composer require -d /usr/share/icinga-php/ipl ipl/stdlib:dev-master \
    && composer require -d /usr/share/icinga-php/ipl ipl/html:dev-master \
    && composer require -d /usr/share/icinga-php/ipl ipl/orm:dev-master \
    && composer require -d /usr/share/icinga-php/ipl ipl/sql:dev-master \
    && composer require -d /usr/share/icinga-php/ipl ipl/validator:dev-master \
    && composer require -d /usr/share/icinga-php/ipl ipl/web:dev-master \
    && composer update -d /usr/share/icinga-php/ipl
RUN rm -rf /usr/share/icingaweb2/modules/icingadb/*
USER www-data
COPY --from=0 /icingadb /usr/share/icingaweb2/modules/icingadb
