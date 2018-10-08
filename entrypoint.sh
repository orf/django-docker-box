#!/usr/bin/env bash

set -e
IFS=$'\n\t'

if [ -z "$(ls -A ./django/)" ]; then
   echo "Incorrect DJANGO_PATH specified."
   exit 1
fi

pip install -r tests/requirements/py3.txt
if [ -n "$EXTRA_REQUIREMENTS" ]; then
    pip install -r tests/requirements/${EXTRA_REQUIREMENTS}
fi

if compgen -G "/oracle/*.zip" > /dev/null; then
    mkdir -p /opt/oracle
    unzip /oracle/*.zip -d /opt/oracle
    echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf
    ldconfig
fi

exec $@
