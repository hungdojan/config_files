#!/usr/bin/env sh

# STATUS=$(tailscale status --json | jq 'if .ExitNodeStatus | type == "object" then 1 else 0 end')
# EXIT_NODE_ADDRESS="rpi-sandbox"

if tailscale status >/dev/null 2>&1; then
    ACTIVE="true"
else
    ACTIVE="false"
fi

if [ "$BLOCK_BUTTON" = "1" ]; then
    if [ "$ACTIVE" = "true" ]; then
        tailscale down
        ACTIVE="false"
    else
        tailscale up
        ACTIVE="true"
    fi
fi

# STATUS=$(tailscale status --json | jq 'if .ExitNodeStatus | type == "object" then 1 else 0 end')
# tailscale status >/dev/null 2>&1
if [ "$ACTIVE" = "true" ]; then
    echo " VPN"
else
    echo "<span foreground='gray'> VPN</span>"
fi
