#!/bin/sh

HOST=1.0.0.1

if ! ping=$(ping -n -c 1 -W 1 $HOST); then
    echo "No Internet "
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        text=""
    elif [ "$rtt" -lt 150 ]; then
        text="""
        text="""
    fi

    echo "$text $rtt ms"
fi
