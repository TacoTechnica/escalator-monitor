#!/bin/bash
while true; do
    git fetch
    if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ] ; then
        git pull origin deploy
    fi
done
