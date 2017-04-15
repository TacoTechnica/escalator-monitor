#!/bin/bash
while true; do
    diff=$(git diff deploy)
    len=${#diff}
    echo "length: $len"
    if [ "$len" -ne "0" ] ; then
        echo "CHANGE DETECTED"
        git pull --no-edit origin deploy
        sudo systemctl try-restart escalator
    fi
done
