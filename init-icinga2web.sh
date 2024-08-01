#!/usr/bin/env bash

set -e
set -o pipefail

for f in $(find /custom_dataweb/customweb.conf.d/* -maxdepth 1 -type f); do
    fileSrc=${f##*/}
    fileDst="/data/etc/icingaweb2/${f##*/}"
    cat "$f" >> "$fileDst"
done


