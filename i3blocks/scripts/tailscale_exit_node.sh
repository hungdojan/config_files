#!/usr/bin/env sh

STATUS=$(tailscale status --json | jq 'if .ExitNodeStatus | type == "object" then 1 else 0 end')
EXIT_NODE_ADDRESS="rpi-sandbox"

if [ "$BLOCK_BUTTON" = "1" ]; then
    if [ "$STATUS" = "1" ]; then
        tailscale set --exit-node=""
    else
        tailscale set --exit-node="$EXIT_NODE_ADDRESS"
    fi
fi

STATUS=$(tailscale status --json | jq 'if .ExitNodeStatus | type == "object" then 1 else 0 end')
if [ "$STATUS" = "1" ]; then
    echo " VPN"
else
    echo "<span foreground='gray'> VPN</span>"
fi
