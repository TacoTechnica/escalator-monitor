#!/bin/bash

while true; do
    env -i git fetch origin deploy
    diff=$(env -i git diff origin/deploy)
    len=${#diff}
    echo "length: $len"
    if [ "$len" -ne "0" ] ; then
        echo "CHANGE DETECTED"
        env -i git pull --no-edit origin deploy
        sudo systemctl try-restart escalator
    fi
done
