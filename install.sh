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

install-deps() {
    local pkgs=(
        hyprland hypridle hyprlock waybar dunst rofi alacritty
        fastfetch grim slurp wireplumber brightnessctl playerctl
        wl-clipboard wtype imagemagick
    )

    local available=()

    for pkg in "${pkgs[@]}"; do
        if apt-cache show "$pkg" &>/dev/null; then
            available+=("$pkg")
        else
            warn "$pkg not found in repos, install manually"
        fi
    done

    if [[ ${#available[@]} -gt 0 ]]; then
        log "installing APT packages..."
        sudo apt update && sudo apt install -y "${available[@]}"
    fi

    if ! command -v cargo &>/dev/null; then
        log "installing cargo via rustup..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source ~/.cargo/env
    else
        log "cargo already installed"
    fi

    if ! command -v matugen &>/dev/null; then
        log "installing matugen..."
        cargo install matugen
    else
        log "matugen already installed"
    fi

    if ! command -v grimblast &>/dev/null; then
        log "installing grimblast..."
        mkdir -p ~/.local/bin
        wget -q "https://raw.githubusercontent.com/hyprwm/contrib/bf1a7cdb086587e6bed6e8ecd285a81c01a11c54/grimblast/grimblast" -O ~/.local/bin/grimblast

        chmod +x ~/.local/bin/grimblast
    else
        log "grimblast already installed"
    fi

    if ! command -v awww &>/dev/null || ! command -v awww-daemon &>/dev/null; then
        log "building awww from source..."

        git clone https://codeberg.org/LGFae/awww.git "${TMPDIR}/awww"
        cargo build --release --manifest-path "${TMPDIR}/awww/Cargo.toml"

        mkdir -p ~/.local/bin
        cp "${TMPDIR}/awww/target/release/awww" ~/.local/bin/
        cp "${TMPDIR}/awww/target/release/awww-daemon" ~/.local/bin/
    else
        log "awww already installed"
    fi
}

install-fonts() {
    local dir="${XDG_DATA_HOME:-$HOME/.local/share}/fonts"
    mkdir -p "$dir"

    if fc-list :lang=en | grep -qi "JetBrainsMonoNerdFont" &>/dev/null; then
        log "nerdfont already installed"
    else
        log "downloading nerdfont..."
        local url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
        local tmp
        tmp=$(mktemp -d)

        curl -fsSL "$url" -o "$tmp/JetBrainsMono.zip"
        unzip -qo "$tmp/JetBrainsMono.zip" -d "$dir" -x "*.txt" "*.md" "readme*" 2>/dev/null

        rm -rf "$tmp"
        log "nerdfont installed"
    fi

    if fc-list :lang=en | grep -qi "MaterialSymbolsRounded" &>/dev/null; then
        log "material symbols already installed"
    else
        log "downloading material symbols..."
        local url="https://github.com/google/material-design-icons/raw/master/variablefont/MaterialSymbolsRounded%5BFILL%2CGRAD%2Copsz%2Cwght%5D.ttf"
        mkdir -p "$dir"
        curl -fsSL "$url" -o "$dir/MaterialSymbolsRounded.ttf"
        log "material symbols installed"
    fi

    fc-cache -f "$dir" &>/dev/null
}

TMPDIR="$(mktemp -d)"
trap 'rm -rf "${TMPDIR}"' EXIT

if [[ ${1:-} == "--help" || ${1:-} == "-h" ]]; then
    echo "Usage: $0 [--no-deps] [--no-fonts] [--no-configs]"
    echo "  --no-deps    Skip dependency installation"
    echo "  --no-fonts   Skip font installation"
    echo "  --no-configs Skip config/script/asset copying"
    exit 0
fi

if [[ $* != *--no-deps* ]]; then
    log "installing dependencies..."
    install-deps
fi

if [[ $* != *--no-fonts* ]]; then
    log "installing fonts..."
    install-fonts
fi

if [[ $* != *--no-configs* ]]; then
    log "copying configs..."
    install-dir ./config ~/.config
    install-dir ./bin ~/.local/bin
    install-dir ./assets ~/.cache/moomin
fi

log "all done"
