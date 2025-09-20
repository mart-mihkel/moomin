#!/usr/bin/env bash

WALLS=~/Pictures/walls

if [ ! -z $1 ]; then
    coproc (
        hellwal -l -s ~/.local/bin/hellwal-post.sh -i $WALLS/$1
        swww img $WALLS/$1 -t fade
    )

    exit 0
fi

ls $WALLS
