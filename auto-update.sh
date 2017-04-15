#!/bin/bash
while true; do
    git fetch
    if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ] ; then
        echo "Change detected! Pulling..."
        git checkout deploy
        git pull origin deploy
    fi
done
