#!/usr/bin/env bash

read -rp "backup ~/.config into a tarball (y/n): " BACKUP_PROMPT

case "$BACKUP_PROMPT" in
    y|Y|yes|YES)
        echo "compressing ~/.config"
        tar -czf ~/config.bak.tar.gz -C ~ .config
        echo "backup saved to ~/config.bak.tar.gz"
        ;;
    n|N|no|NO)
        echo "skipping backup"
        ;;
    *)
        echo "invalid response, enter y or n"
        exit 1
        ;;
esac

# copy configs
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/.cache/moomin/wallpapers

cp -v ./bin/* ~/.local/bin
cp -rv ./config/* ~/.config
cp -v ./assets/wallpapers/* ~/.cache/moomin/wallpapers

# generate hellwal templates
mkdir -p ~/.cache/hellwal
hellwal --skip-term-colors -q -l -i ./assets/wallpapers/01-coffer.png &

# build thumbnails for wallpaper selector
WALLPAPERS=~/.cache/moomin/wallpapers
THUMBNAILS=~/.cache/moomin/thumbnails

mkdir -p $WALLPAPERS
mkdir -p $THUMBNAILS
for WALL in $WALLPAPERS/*; do
    magick convert \
        -strip $WALL \
        -thumbnail x540^ \
        -gravity center \
        -extent 330x500 \
        $THUMBNAILS/$(basename $WALL)
done
