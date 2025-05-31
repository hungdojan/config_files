#!/bin/bash
libinput-gestures-setup start

SEC_DISP=$(xrandr --query | grep "DisplayPort" | cut -d' ' -f2)
if [[ $SEC_DISP == "connected" ]]; then
    # .screenlayout/vertical.sh
    ~/.screenlayout/usti_setup.sh
fi
