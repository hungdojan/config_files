#!/bin/sh


run_command() {
    if [ "${COMMAND}" = "START" ]; then
        sudo virsh start "${VM}"
    elif [ "${COMMAND}" = "END" ]; then
        sudo virsh shutdown "${VM}"
    else
        exit 1
    fi
}

COMMAND="START"
VM="fedora39"

while getopts "stm" opt; do
    case "${opt}" in
        s)
            COMMAND="END"
            ;;
        m)
            VM="minikube"
            ;;
        t)
            VM="fedora39-2"
            ;;
        *)
            echo "unknown option"
            exit 1
            ;;
    esac
done

run_command
