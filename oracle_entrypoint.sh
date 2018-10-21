#!/usr/bin/env bash

set -e
IFS=$'\n\t'

if compgen -G "/oracle/*.zip" > /dev/null; then
    sudo mkdir -p /opt/oracle
    sudo unzip /oracle/*.zip -d /opt/oracle
    sudo bash -c "echo /opt/oracle/instantclient* > /etc/ld.so.conf.d/oracle-instantclient.conf"
    sudo ldconfig
fi
exec $@
