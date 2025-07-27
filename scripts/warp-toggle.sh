#!/bin/bash

# Get current warp status
status=$(warp-cli status 2>/dev/null | grep "Status update:" | cut -d: -f2 | xargs)

case "$status" in
    "Connected")
        warp-cli disconnect
        ;;
    "Disconnected")
        warp-cli connect
        ;;
    "Connecting")
        # If connecting, disconnect to cancel
        warp-cli disconnect
        ;;
    *)
        # Try to connect if status is unknown
        warp-cli connect
        ;;
esac