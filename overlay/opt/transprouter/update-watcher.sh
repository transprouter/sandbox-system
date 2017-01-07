#!/bin/bash

touch /opt/transprouter/transprouter
chmod +x /opt/transprouter/transprouter

while true ; do
  inotifywait -e close_write /opt/transprouter/transprouter && {
    logger -t transprouter "update detected"
    killall transprouter || killall -9 transprouter
    logger -t transprouter "service stopped"
    logger -t transprouter "starting version $(sha1sum /opt/transprouter/transprouter)"
    nohup /opt/transprouter/transprouter | logger -t transprouter &
  }
done
