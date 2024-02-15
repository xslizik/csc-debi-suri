#!/bin/bash

LOG_LOCATION="/etc/suricata/log"
CONFIG_FILE="/etc/suricata/suricata.yaml"
HOST_IP="10.10.20.5"
INTERFACE="enp0s8"
LIVE_DB="/etc/suricata/live_db"

rm -rf "$LIVE_DB"/*

if [ ! -d "$LOG_LOCATION" ]; then
    mkdir "$LOG_LOCATION"
else
    rm -rf "$LOG_LOCATION"/*
fi

echo "To display logs in Evebox use"
echo "evebox server -v -D $LIVE_DB --datastore sqlite --input $LOG_LOCATION/eve.json --host $HOST_IP"

sudo suricata -c $CONFIG_FILE -l $LOG_LOCATION -i $INTERFACE --runmode=workers