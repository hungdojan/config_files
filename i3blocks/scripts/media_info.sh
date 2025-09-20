#!/bin/bash

output=""
# stat="$(playerctl status)" # Test, zda je nejaky prehravac aktivni
active=false

# Player found
if playerctl status > /dev/null 2>&1; then
    # Prochazi vsemi aktivnimi prehravaci a zobrazi data prvniho, ktery nema status "Stopped"
    for n in $(playerctl --list-all)
    do
        stat=$(playerctl --player="$n" status)
        if [[ $stat == "Stopped" ]]; then
            continue
        else
            if [[ $stat == "Playing" ]]; then
                output=""
            elif [[ $stat == "Paused" ]]; then
                output=""
            fi
            # Nacte data o pisnicce
            output+=" $(playerctl metadata --player="$n" --format ' {{ artist }} - {{ title }}' | sed 's_&_&amp;_g; s_<_&lt;_g; s_>_&gt;_g;')"

            if cmus-remote -Q >/dev/null 2>&1 && [[ "$n" == "cmus" ]]; then
                dur="$(cmus-remote -Q | grep "duration" | cut -d' ' -f2)"
                pos="$(cmus-remote -Q | grep "position" | cut -d' ' -f2)"
                output+=" <span foreground='yellow'>$(date -d@"$pos" -u +%M:%S)/$(date -d@"$dur" -u +%M:%S)</span>"
            fi

            # Play-pause button event
            if [[ "${BLOCK_BUTTON}" = "1" ]]; then
                playerctl play-pause
            fi
            # Nalezlo prehravac, ktery je aktivni
            active=true
            break
        fi
    done
    # Zadny prehravac neni aktivni
    if ! $active; then
        output=" No audio"
    fi
fi

# Finalni vystup na STDOUT
echo "$output"
