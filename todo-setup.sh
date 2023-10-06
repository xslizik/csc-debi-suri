#!/usr/bin/env bash

# Author:       Josh Stroschein
# Date:         22 Nov 2020
# Reference:    https://suricata-update.readthedocs.io/en/latest/quickstart.html#directories-and-permissions

SURICATA_DIR=/usr/local/var/lib/suricata/
SURICATA_RULES=/usr/var/lib/suricata/rules/
SURICATA_UPDATE=/usr/var/lib/suricata/update/

SESSION_USER=$(logname)

# Create group for suricata
groupadd suricata

# Change default directory group owner:
if [ ! -d "$SURICATA_DIR" ]; then
    mkdir -p $SURICATA_DIR
fi
chgrp -R suricata $SURICATA_DIR

if [ ! -d "$SURICATA_RULES" ]; then
    mkdir -p $SURICATA_RULES
fi
chgrp -R suricata $SURICATA_RULES

if [ ! -d "$SURICATA_UPDATE" ]; then
    mkdir -p $SURICATA_UPDATE
fi
chgrp -R suricata $SURICATA_UPDATE

# Setup the directories with the correct permissions for the suricata group:
sudo chmod -R g+r $SURICATA_DIR
sudo chmod -R g+rw $SURICATA_RULES
sudo chmod -R g+rw $SURICATA_UPDATE

# Now, add user current user to the group:
usermod -a -G suricata $SESSION_USER

# Please note, you may need to restart your machine