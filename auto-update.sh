#!/bin/bash
while true; do
    git fetch origin deploy
    diff=$(git diff origin/deploy)
    len=${#diff}
    echo "length: $len"
    if [ "$len" -ne "0" ] ; then
        echo "CHANGE DETECTED"
        git pull --no-edit origin deploy
        sudo systemctl try-restart escalator
    fi
done
