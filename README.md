# Moomin

Moomin themed Linux rice!

| ![fetch](./assets/screenshots/floating.png) | ![fetch](./assets/screenshots/fetch.png) |
| ------------------------------------------- | ---------------------------------------- |
| ![fetch](./assets/screenshots/zathura.png)  | ![fetch](./assets/screenshots/walls.png) |
| ![fetch](./assets/screenshots/power.png)    | ![fetch](./assets/screenshots/rofi.png)  |
| ![fetch](./assets/screenshots/lock.png)     |                                          |

## Dependencies

| program            | usage                |
| ------------------ | -------------------- |
| `hyprland`         | windowmanager        |
| `hyprlock`         | session locker       |
| `hypridle`         | idle daemon          |
| `alacritty`        | terminal             |
| `waybar`           | status bar           |
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

