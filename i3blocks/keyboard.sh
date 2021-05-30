#!/bin/bash

var=$(echo -n $(xset -q | grep -m 1 "LED mask:" | awk -F: '{print $4}'))
if [[ "$var" == "00000000" ]]; then
    echo "US"
else
    echo "CZ"
fi
