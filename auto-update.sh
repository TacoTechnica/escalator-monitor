#!/bin/bash

# User setup because it crashes if you dont do this..."
env -i git config user.email "adrisj7@gmail.com"
env -i git config user.name "adrisj7 PI"

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
