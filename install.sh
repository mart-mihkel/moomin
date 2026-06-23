#!/usr/bin/env bash

set -euo pipefail

log()  { printf "\033[1;34m[%s]\033[0m %s\n" "$(date '+%H:%M:%S')" "$*"; }
warn() {
    if [[ "$1" == "-n" ]]; then
        shift
        printf "\033[1;33m[%s]\033[0m %s" "$(date '+%H:%M:%S')" "$*"
    else
        printf "\033[1;33m[%s]\033[0m %s\n" "$(date '+%H:%M:%S')" "$*"
    fi
}

confirm-overwrite() {
    local src="$1"
    local dest="$2"

    if [ ! -e "$dest" ]; then
        return 0
    fi

    if diff -q "$src" "$dest" &>/dev/null; then
        return 1
    fi

    warn -n "$(basename "$dest") differs from $src, overwrite? [y/N] "
    read -r </dev/tty

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

install-file() {
    local src="$1"
    local dest="$2"
    local parent="$(dirname "$dest")"

    mkdir -p "$parent"

    if confirm-overwrite "$src" "$dest"; then
        cp "$src" "$dest"
        log "Installed $dest"
    fi
}

install-dir() {
    local src="$1"
    local dest="$2"
    local file
    local path

    mkdir -p "$dest"

    while IFS= read -r -d '' file; do
        path="${file#$src/}"
        install-file "$file" "$dest/$path"
    done < <(find "$src" -type f -print0)
}

log "Copying configs..."
install-dir ./config ~/.config

log "Copying scripts..."
install-dir ./bin ~/.local/bin

log "Copying assets..."
install-dir ./assets ~/.cache/moomin

log "Configs installed"
