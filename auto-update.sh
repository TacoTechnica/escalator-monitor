#!/bin/bash
while true; do
    diff=$(git diff deploy)
    len=${#diff}
    echo "diff: $diff"
    echo "len: $len"
    if [ "$len" -ne "0" ] ; then
        echo "CHANGE DETECTED"
        git pull --no-edit origin deploy
    fi
    # There's gotta be a better way to do this
    #git fetch
    #if [ $(git rev-parse HEAD) != $(git rev-parse @{u}) ] ; then
    #    echo "Change detected! Pulling..."
    #    git checkout deploy
    #    git pull origin deploy
    #fi
done
