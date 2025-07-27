#!/bin/bash

# Get warp status
status=$(warp-cli status 2>/dev/null | grep "Status update:" | cut -d: -f2 | xargs)

case "$status" in
    "Connected")
        echo '{"text": "󰖂 VPN", "class": "connected", "tooltip": "Warp VPN: Connected"}'
        ;;
    "Connecting")
        echo '{"text": "󰖁 VPN", "class": "connecting", "tooltip": "Warp VPN: Connecting..."}'
        ;;
    "Disconnected")
        echo '{"text": "󰖀 VPN", "class": "disconnected", "tooltip": "Warp VPN: Disconnected"}'
        ;;
    *)
        echo '{"text": "󰖀 VPN", "class": "error", "tooltip": "Warp VPN: Status unknown"}'
        ;;
esac