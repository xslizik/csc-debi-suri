#!/bin/bash

FILE="$1"
NEW_STR1="$2"
NEW_STR2="$3"
NEW_STR3="$4"


OLD_STR1="flag3"
OLD_STR2="flag4"
OLD_STR3="flag5"


sed -i "s|$OLD_STR1|$NEW_STR1|g" "$FILE"
sed -i "s|$OLD_STR2|$NEW_STR2|g" "$FILE"
sed -i "s|$OLD_STR3|$NEW_STR3|g" "$FILE"
echo "Replaced $OLD_STR with $NEW_STR in $FILE"