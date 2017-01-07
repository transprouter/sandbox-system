#!/bin/bash

touch /opt/transprouter/transprouter
mkdir -p /opt/transprouter/current

while true ; do
  inotifywait -e close_write /opt/transprouter/transprouter && {
    logger -t transprouter "update detected"
    logger -t transprouter "stopping version $(cd /opt/transprouter/current ; sha1sum transprouter)"
    killall -9 transprouter
    logger -t transprouter "service stopped"
    cp /opt/transprouter/transprouter /opt/transprouter/current/transprouter
    chmod +x /opt/transprouter/current/transprouter
    logger -t transprouter "starting version $(cd /opt/transprouter/current ; sha1sum transprouter)"
    nohup /opt/transprouter/current/transprouter | logger -t transprouter &
  }
done
