#!/bin/sh

STATUS="$(pactl get-source-mute @DEFAULT_SOURCE@ | cut -f2 -d' ')"

if [[ "$STATUS" == "no" ]]; then
    echo ""
else
    echo ""
fi

if [[ "$BLOCK_BUTTON" = "1" ]]; then
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
fi
