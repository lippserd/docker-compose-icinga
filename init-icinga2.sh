#!/usr/bin/env bash

set -o pipefail

echo "Starting init-icinga2.sh script"

if [ ! -f /data/etc/icinga2/conf.d/icingaweb-api-user.conf ]; then
  sed "s/\$ICINGAWEB_ICINGA2_API_USER_PASSWORD/${ICINGAWEB_ICINGA2_API_USER_PASSWORD:-icingaweb}/" /config/icingaweb-api-user.conf >/data/etc/icinga2/conf.d/icingaweb-api-user.conf
fi

if [ ! -f /data/etc/icinga2/features-enabled/icingadb.conf ]; then
  mkdir -p /data/etc/icinga2/features-enabled
  cat /config/icingadb.conf >/data/etc/icinga2/features-enabled/icingadb.conf
fi

optional_confd=`grep 'include_recursive "/custom_data/custom.conf.d"' /etc/icinga2/icinga2.conf`
echo $optional_confd
if [ -z "$optional_confd" ]; then
  echo "Create include_recursive for custom.conf.d in icinga2.conf"
  echo 'include_recursive "/custom_data/custom.conf.d"' >> /etc/icinga2/icinga2.conf
fi
