#!/usr/bin/env bash

WALLS=~/Pictures/walls
CACHE=$HOME/.cache/hellwal
CONFIG=$HOME/.config

if [ ! -z $1 ]; then
    WALLPAPER=$WALLS/$1
    coproc (
        hellwal -l -i $WALLPAPER
        swww img $WALLPAPER \
            --transition-type grow \
            --transition-duration 2 \
            --transition-fps 60

        mkdir -p $CONFIG/dunst
        cp $CACHE/dunst.toml $CONFIG/dunst/dunstrc
        dunstctl reload
    )

    exit 0
fi

ls $WALLS
