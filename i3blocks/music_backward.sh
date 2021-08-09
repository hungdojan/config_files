#!/bin/sh

if playerctl status 2>/dev/null 1>&2; then 
    echo ""
fi

if [[ "${BLOCK_BUTTON}" = "1" ]]; then
    playerctl previous
fi
