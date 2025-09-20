#!/bin/sh

if playerctl status > /dev/null 2>&1; then
    for n in $(playerctl --list-all)
    do
        stat=$(playerctl --player=$n status)
        if [[ "$n" == "cmus" ]]; then
            if [[ "$(playerctl shuffle)" == "On" ]]; then
                echo "<span foreground='white'></span>"
            else
                echo "<span foreground='gray'></span>"
            fi

            if [[ "$BLOCK_BUTTON" = "1" ]]; then
                cmus-remote -S
            fi
        fi
    done
fi


