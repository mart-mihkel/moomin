# Moomin

| ![](./assets/screenshots/floating.png) | ![](./assets/screenshots/zathura.png) |
| -------------------------------------- | ------------------------------------- |
| ![](./assets/screenshots/walls.png)    | ![](./assets/screenshots/rofi.png)    |

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
> Backup your configs beforehand

```bash
mkdir -p ~/.config
mkdir -p ~/.local/bin
mkdir -p ~/Pictures/wallpapers

cp -r config/* ~/.config
cp bin/* ~/.local/bin
cp assets/wallpapers/* ~/Pictures/wallpapers
```

Press `Mod+B` to run the wallpaper selector, it will take some time when starting for the first time.
