FROM icinga/icinga2:latest

USER root

RUN apt update && \
    apt upgrade -y && \
    apt install -y make snmp less && \
    cpan String::Random && \
    apt clean -y && \
    curl https://raw.githubusercontent.com/nguttman/Nagios-Checks/master/SIP/check_sip2 \
      -o /usr/lib/nagios/plugins/check_sip2 && \
    chmod +x /usr/lib/nagios/plugins/check_sip2

USER icinga