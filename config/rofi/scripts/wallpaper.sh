#!/usr/bin/env bash

WALLS=~/Pictures/walls
CACHE=$HOME/.cache/hellwal
CONFIG=$HOME/.config

if [ ! -z $1 ]; then
    WALLPAPER=$WALLS/$1
    coproc (
        hellwal -l -i $WALLPAPER
        swww img $WALLPAPER -t fade

        mkdir -p $CONFIG/dunst
        cp $CACHE/dunst.toml $CONFIG/dunst/dunstrc

        pkill -SIGUSR2 waybar
        dunstctl reload
    )

    exit 0
fi

for WALLPAPER in $WALLS/*; do
    BN=$(basename $WALLPAPER)
    echo -e "${BN}\0icon\x1f${WALLPAPER}"
done
