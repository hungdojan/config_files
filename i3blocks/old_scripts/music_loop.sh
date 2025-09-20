#!/bin/sh

if playerctl status > /dev/null 2>&1; then
    for n in $(playerctl --list-all)
    do
        stat=$(playerctl --player=$n status)
        if [[ "$n" == "cmus" ]]; then
            loop_stat=$(playerctl loop)

            case $loop_stat in 
                "None")
                    echo "<span foreground='gray'></span>"
                    if [[ "$BLOCK_BUTTON" = "1" ]]; then
                        playerctl --player=$n loop "Playlist"
                    fi
                    ;;
                "Playlist")
                    echo "<span foreground='white'></span>"
                    if [[ "$BLOCK_BUTTON" = "1" ]]; then
                        playerctl --player=$n loop "Track"
                    fi
                    ;;
                "Track")
                    echo "<span foreground='red'></span>"
                    if [[ "$BLOCK_BUTTON" = "1" ]]; then
                        playerctl --player=$n loop "None"
                    fi
                    ;;
            esac
        fi
    done
fi
