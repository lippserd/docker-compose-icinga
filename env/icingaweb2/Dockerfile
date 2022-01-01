FROM alpine/git
WORKDIR /
RUN apk --no-cache add curl \
    && curl -o Legacy.less https://raw.githubusercontent.com/Icinga/icingaweb2/support/2.9/public/css/icinga/legacy-theme.less \
    && curl -o select-icon-legacy.svg https://raw.githubusercontent.com/Icinga/icingaweb2/support/2.9/public/img/select-icon-legacy.svg \
    && git clone https://github.com/Icinga/icingadb-web.git icingadb

FROM icinga/icingaweb2:master
USER root
RUN apt update \
    && apt install -y composer \
    && composer config -d /usr/share/icinga-php/ipl platform.php `php -i | awk '/PHP Version/ {print $NF; exit}'` \
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
COPY --from=0 /Legacy.less /usr/share/icingaweb2/public/css/themes/Legacy.less
COPY --from=0 /select-icon-legacy.svg /usr/share/icingaweb2/public/img/select-icon-legacy.svg
