#!/bin/bash
while true; do
    git pull origin deploy# There's gotta be a better way to do this
    #git fetch
    #if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ] ; then
    #    echo "Change detected! Pulling..."
    #    git checkout deploy
    #    git pull origin deploy
    #fi
done
