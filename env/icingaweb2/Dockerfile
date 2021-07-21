FROM alpine/git
WORKDIR /
COPY icingadb-load-monitoring.patch .
RUN git clone https://github.com/Icinga/icingadb-web.git icingadb && \
    git apply --directory icingadb icingadb-load-monitoring.patch

FROM icinga/icingaweb2:2.9
USER root
RUN rm -rf /usr/share/icingaweb2/modules/icingadb/*
USER www-data
COPY --from=0 /icingadb /usr/share/icingaweb2/modules/icingadb
