#!/usr/bin/bash

# Skript slouzi k pripojeni a odpojeni disku ze systemu
# Prijme od uzivatele argument pro akci, kterou pak provede

DISK=/dev/nvme1n1p3
P=/home/rebulien/disk/
MOUNT='mount'
UNMOUNT='unmount'

COMMAND=''

# nacteni argumentu u/m
if [ $# -gt 0 ]; then
    for i in $@
    do
        # echo "$i"
        if [[ $i = 'm' ]] || [[ $i = $MOUNT ]]; then
            COMMAND=$MOUNT
            break
        elif [[ $i = 'u' ]] || [[ $i = $UNMOUNT ]]; then
            COMMAND=$UNMOUNT
            break
        fi
    done
fi

# kontrola, zda byl nacten nejaky argument
# pokud se nic nenacetlo, tak program hodi chybovou hlasku
if [ "$COMMAND" == "" ]; then
    echo 'Error: invalid argument syntax'
    exit
fi

# nacteni specialnich flagu na zmenu umisteni disku 
# ci samotneho disku
while getopts d:p: flag
do
    case "${flag}" in
        d) DISK=${OPTARG};; # Disk
        p) P=${OPTARG};;    # Path
    esac
done

echo "Destination: $P"
echo "Disk: $DISK"
echo ""

if [[ $COMMAND = $MOUNT ]]; then
    if [[ $2 == 'S' ]]; then
        sudo -S mount ${DISK} ${P}
    else
        sudo mount ${DISK} ${P}
    fi
elif [[ $COMMAND = $UNMOUNT ]]; then
    sudo umount ${P}
else
    echo 'Unexpected error'
    echo 'Action could not be finished'
fi

if [ "$(ls -A $P)" ] && [ "$COMMAND" == "$MOUNT" ]; then
    echo "Disk $DISK successfully ${MOUNT}ed at $P."
elif [ ! "$(ls -A $P)" ] && [ "$COMMAND" == "$UNMOUNT" ]; then
    echo "Disk $DISK successfully ${UNMOUNT}ed."
else
    echo "Action aborted."
fi
