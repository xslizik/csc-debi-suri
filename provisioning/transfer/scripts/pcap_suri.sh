#!/bin/bash

LOG_LOCATION="/etc/suricata/log"
CONFIG_FILE="/etc/suricata/suricata.yaml"
HOST_IP="10.10.20.5"
PCAP_FILE="$1"

if [ ! -f "$PCAP_FILE" ]; then
    echo "The file '$PCAP_FILE' does not seem to exist. Please supply a valid pcap file."
    exit 1
fi

if [ ! -d "$LOG_LOCATION" ]; then
    mkdir "$LOG_LOCATION"
else
    rm -rf "$LOG_LOCATION"/*
fi

sudo suricata -c $CONFIG_FILE -l $LOG_LOCATION -r $PCAP_FILE --runmode=autofp

evebox oneshot --host $HOST_IP $LOG_LOCATION/eve.json