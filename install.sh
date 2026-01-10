#!/usr/bin/env bash

ESC="\033"
FG1="${ESC}[38;5;1m"
FG2="${ESC}[38;5;2m"
RES="${ESC}[0m"

read -rp "backup ~/.config into a tarball (y/n): " BACKUP_ANSWER
if [[ $BACKUP_ANSWER == y ]]; then
    printf "compressing ~/.config\n"
    tar -czf ~/config.bak.tar.gz ~/.config
    printf "${FG2}backup saved to ~/config.bak.tar.gz${RES}\n"
elif [[ $BACKUP_ANSWER == n ]]; then
    printf "${FG1}skipping backup${RES}\n"
else
    printf "${FG1}invalid response, quitting install${RES}\n"
    exit 1
fi

printf "copying configurations\n"
WALLPAPERS=~/.cache/moomin/wallpapers
THUMBNAILS=~/.cache/moomin/thumbnails

mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p $WALLPAPERS
mkdir -p $THUMBNAILS

cp -r ./config/* ~/.config
cp ./bin/* ~/.local/bin
cp ./assets/wallpapers/* $WALLPAPERS

printf "generating hellwal templates\n"
mkdir -p ~/.cache/hellwal
hellwal --skip-term-colors -q -l -i ./assets/wallpapers/01-coffer.png

printf "creating thumbnails for wallpaper selector\n"
for WALL in $WALLPAPERS/*; do
    magick convert \
        -quiet \
        -strip $WALL \
        -thumbnail x540^ \
        -gravity center \
        -extent 330x500 \
        $THUMBNAILS/$(basename $WALL) 2>/dev/null
done

printf "${FG2}install finished${RES}\n"
