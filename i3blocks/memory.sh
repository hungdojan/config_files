#!/bin/sh

echo "$(free -m | grep "Mem" | tr -s ' ' | awk -F ' ' '
    { 
        if ($3 >= 1024)
            printf "%.1f Gi\n", $3/1024;
        else
            printf "%.1f Mi\n", $3;
    }'
)"
