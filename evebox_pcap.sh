#!/usr/bin/bash

LOG_LOCATION="/tmp/suricata/"
CONFIG_FILE="/usr/local/var/lib/suricata/suricata.yaml"
PCAP_FILE="$1"
HOST_IP="127.0.0.1"

if [ ! -f "$PCAP_FILE" ]; then
    echo "The file '$PCAP_FILE' does not seem to exist. Please supply a valid pcap file."
    exit 1
fi

if [ ! -d "$LOG_LOCATION" ]; then
    mkdir "$LOG_LOCATION"
else
    rm -rf "$LOG_LOCATION"/*
fi

suricata -c "$CONFIG_FILE" -k none -l "$LOG_LOCATION" -r "$PCAP_FILE" --runmode=autofp

evebox oneshot --host "$HOST_IP" "$LOG_LOCATION/eve.json"