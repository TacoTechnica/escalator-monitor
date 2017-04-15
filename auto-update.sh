#!/bin/bash
while true; do
    if $(git rev-parse HEAD) == $(git rev-parse @{u}); then
        git pull
    fi
done
