FROM alpine/git
WORKDIR /
RUN git clone https://github.com/Icinga/icingadb-web.git icingadb

FROM icinga/icingaweb2:2.9
USER root
RUN rm -rf /usr/share/icingaweb2/modules/icingadb/*
USER www-data
COPY --from=0 /icingadb /usr/share/icingaweb2/modules/icingadb
