#!/usr/bin/env bash

set -e
IFS=$'\n\t'

if [ -z "$(ls -A ./django/)" ]; then
   echo "Incorrect DJANGO_PATH specified."
   exit 1
fi

sudo pip install -r tests/requirements/py3.txt

if [ -n "$EXTRA_REQUIREMENTS" ]; then
    sudo pip install -r tests/requirements/${EXTRA_REQUIREMENTS}
fi

if compgen -G "/oracle/*.zip" > /dev/null; then
    sudo mkdir -p /opt/oracle
    sudo unzip /oracle/*.zip -d /opt/oracle
    sudo bash -c "echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf"
    sudo ldconfig
fi

exec $@
