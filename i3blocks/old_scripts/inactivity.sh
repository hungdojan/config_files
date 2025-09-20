#!/usr/bin/env bash

DEFAULT_BAT_TIME=20
DEFAULT_AC_TIME=30

# path $HOME/.config/xfce4/xfconf/xfce-perchannel-xml
COMMAND="xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/"
AC_SETTINGS="inactivity-on-ac"
BAT_SETTINGS="inactivity-on-battery"

CURR_VAL=$(eval "$COMMAND""inactivity-on-ac")

if [[ "$CURR_VAL" -gt 0 ]]; then
    echo "<span foreground='white'></span>"
    echo ""
    if [[ "$BLOCK_BUTTON" = '1' ]]; then
        eval "$COMMAND""$AC_SETTINGS"" -s 0"
        eval "$COMMAND""$BAT_SETTINGS"" -s 0"
    fi
else
    echo "<span foreground='gray'></span>"
    if [[ "$BLOCK_BUTTON" = '1' ]]; then
        eval "$COMMAND""$AC_SETTINGS"" -s $DEFAULT_AC_TIME"
        eval "$COMMAND""$BAT_SETTINGS"" -s $DEFAULT_BAT_TIME"
    fi
fi
