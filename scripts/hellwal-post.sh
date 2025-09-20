#!/usr/bin/env bash

CACHE=$HOME/.cache/hellwal
CONFIG=$HOME/.config

mkdir -p $CONFIG/dunst
cp $CACHE/dunst.toml $CONFIG/dunst/dunstrc

pkill -SIGUSR2 waybar
dunstctl reload
