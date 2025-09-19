#!/usr/bin/env bash

CACHE=$HOME/.cache/hellwal
CONFIG=$HOME/.config

cp $CACHE/waybar.css $CONFIG/waybar/style.css
cp $CACHE/dunstrc $CONFIG/dunst/dunstrc

pkill -SIGUSR2 waybar
dunstctl reload
