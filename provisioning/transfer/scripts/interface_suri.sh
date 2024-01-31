#!/bin/bash

LOG_LOCATION="/tmp"
CONFIG_FILE="/usr/local/var/lib/suricata/suricata.yaml"
HOST_IP="10.10.20.5"

if [ ! -d "$LOG_LOCATION" ]; then
    mkdir "$LOG_LOCATION"
else
    rm -rf "$LOG_LOCATION"/*
fi

echo "To display logs in Evebox use"
echo "evebox oneshot --host "$HOST_IP" "$LOG_LOCATION/eve.json""

sudo suricata -c "$CONFIG_FILE" -k all -l "$LOG_LOCATION" -i enp0s8 --runmode=workers