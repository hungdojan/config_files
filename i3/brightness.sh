#!/bin/bash

FILE_PATH="/sys/class/backlight/amdgpu_bl0/brightness"
DIFF=16

CURR_BRIGHTNESS=$(cat $FILE_PATH | head -n 1)

while getopts "id" opt; do
    case $opt in
        i)
            if [ $CURR_BRIGHTNESS -lt 255 ]; then
                CURR_BRIGHTNESS=$(($CURR_BRIGHTNESS+$DIFF))
                if [ $CURR_BRIGHTNESS -gt 255 ]; then
                    CURR_BRIGHTNESS=255
                fi
            fi
            ;;
        d)
            if [ $CURR_BRIGHTNESS -gt 0 ]; then
                CURR_BRIGHTNESS=$(($CURR_BRIGHTNESS-$DIFF))
                if [ $CURR_BRIGHTNESS -lt 0 ]; then
                    CURR_BRIGHTNESS=0
                fi
            fi
            ;;
        *)
            echo "Neplatny argument" >&2
            exit 1
            ;;
    esac
done

echo $CURR_BRIGHTNESS > $FILE_PATH
