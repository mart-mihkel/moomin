# Moomin

Moomin themed Linux rice!

<p align="center">
  <img align="center" width="49%" src="https://github.com/mart-mihkel/moomin/blob/master/assets/screenshots/floating.png?raw=true" />
  <img align="center" width="49%" src="https://github.com/mart-mihkel/moomin/blob/master/assets/screenshots/fetch.png?raw=true" />
  <img align="center" width="49%" src="https://github.com/mart-mihkel/moomin/blob/master/assets/screenshots/wallpapers.png?raw=true" />
  <img align="center" width="49%" src="https://github.com/mart-mihkel/moomin/blob/master/assets/screenshots/lock.png?raw=true" />
</p>

## Dependencies

| program            | usage                |
| ------------------ | -------------------- |
| `hyprland`         | windowmanager        |
| `hyprlock`         | session locker       |
| `hypridle`         | idle daemon          |
| `alacritty`        | terminal             |
| `waybar`           | status bar           |
| `dunst`            | notification daemon  |
| `swww`             | wallpaper daemon     |
| `rofi`             | launcher             |
| `hellwal`          | coloschemes          |
| `fastfetch`        | system info          |
| `imagemagick`      | wallpaper thumbnails |
| `jetbrains-mono`   | font                 |
| `material-symbols` | icon font            |

## Install

> [!CAUTION]
> Backup your current configs beforehand

```bash
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/Pictures/walls

cp -r config/* ~/.config
cp script/* ~/.local/bin
cp assets/walls/* ~/Pictures/walls
```

Press `Mod+B` to run the wallpaper selector, it will take some time when starting for the first time.

