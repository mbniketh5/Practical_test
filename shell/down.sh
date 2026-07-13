#!/bin/bash

services="docker maven tomcat10 jenkins"

for svc in $services
do
  systemctl is-active --quiet $svc
  if [ $? -ne 0 ]; then
    echo "$svc is down. Starting..."
    sudo systemctl start $svc
    echo "$(date): $svc restarted" >> stopped_services.log
  else
    echo "$svc is running."
  fi
done

