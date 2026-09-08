# Omarchy Wallpaper Guide (`omarchy-wallpaper-guide`)

> **Unofficial / Community Documentation**: Comprehensive guide to static backgrounds and optional video wallpapers on Omarchy Hyprland.

> **Important Principle**:
> Themes work without live wallpapers. Video wallpaper support is optional, separate from themes, and removable without affecting theme colors, Omarchy configuration, or the rest of the desktop.

---

## Table of Contents

- [Overview](#overview)
- [Static Wallpapers (Standard Flow)](#static-wallpapers-standard-flow)
- [Optional Video Wallpapers](#optional-video-wallpapers)
- [Hardware & Battery Risks](#hardware--battery-risks)
- [Emergency Stop & Rollback](#emergency-stop--rollback)
- [Showcase](#showcase)
- [License](#license)

---

## Overview

This repository provides documentation, troubleshooting procedures, and clean configuration examples for managing desktop wallpapers in Omarchy. **No copyrighted downloaded wallpapers or video files are bundled in this repository.**

---

## Static Wallpapers (Standard Flow)

Static wallpapers are fully supported natively by Omarchy.

1. Obtain a high-resolution wallpaper you have the legal right to use.
2. Place the image into your active theme directory:
   ```text
   ~/.config/omarchy/themes/<theme-slug>/backgrounds/wallpaper_name.png
   ```
3. Use native Omarchy commands:
   ```bash
   omarchy theme bg next
   omarchy theme bg-switcher
   ```
See [docs/STATIC-WALLPAPERS.md](docs/STATIC-WALLPAPERS.md) for full instructions.

---

## Optional Video Wallpapers

Video wallpapers run via an isolated, user-owned background player (e.g. `mpvpaper`).

- **Configuration Path**: `~/.config/omarchy-wallpaper-player/config.toml`
- **Optional Service**: `~/.config/systemd/user/omarchy-wallpaper-player.service`
- **Safety**: Never modifies `shell.json` or `colors.toml`.

See [docs/VIDEO-WALLPAPERS.md](docs/VIDEO-WALLPAPERS.md) for setup and service files.

---

## Hardware & Battery Risks

- **CPU & GPU Utilization**: Video decoding adds constant GPU load.
- **Battery Drain**: Continuous video playback significantly reduces laptop battery life.
- **Suspend/Resume**: Wayland surfaces may require re-initialization after waking from sleep.

---

## Emergency Stop & Rollback

If your desktop becomes sluggish or unresponsive:

```bash
./install.sh stop
# Or directly in terminal:
pkill -9 mpvpaper
systemctl --user stop omarchy-wallpaper-player.service 2>/dev/null || true
```
Normal static background rendering is instantly restored without altering your active theme.

---

## Showcase

> Visual previews, UI screenshots, and recordings for documentation and release verification.

### Main experience

<!-- Future image: assets/showcase/wallpaper-hero.png -->
<!-- ![Main desktop experience](assets/showcase/wallpaper-hero.png) -->

### Feature gallery

<!-- Future image: assets/showcase/static-wallpaper-guide.png -->
<!-- ![static-wallpaper-guide.png](assets/showcase/static-wallpaper-guide.png) -->

<!-- Future image: assets/showcase/video-wallpaper-setup.png -->
<!-- ![video-wallpaper-setup.png](assets/showcase/video-wallpaper-setup.png) -->

<!-- Future image: assets/showcase/emergency-stop-procedure.png -->
<!-- ![emergency-stop-procedure.png](assets/showcase/emergency-stop-procedure.png) -->

<!-- Future image: assets/showcase/feature-04.png -->
<!-- ![Feature preview 4](assets/showcase/feature-04.png) -->

<!-- Future image: assets/showcase/feature-05.png -->
<!-- ![Feature preview 5](assets/showcase/feature-05.png) -->

<!-- Future image: assets/showcase/feature-06.png -->
<!-- ![Feature preview 6](assets/showcase/feature-06.png) -->

<!-- Future image: assets/showcase/feature-07.png -->
<!-- ![Feature preview 7](assets/showcase/feature-07.png) -->

<!-- Future image: assets/showcase/feature-08.png -->
<!-- ![Feature preview 8](assets/showcase/feature-08.png) -->

<!-- Future image: assets/showcase/feature-09.png -->
<!-- ![Feature preview 9](assets/showcase/feature-09.png) -->

<!-- Future image: assets/showcase/feature-10.png -->
<!-- ![Feature preview 10](assets/showcase/feature-10.png) -->

### Motion and interaction

<!-- Future GIF: assets/showcase/interaction-01.gif -->
<!-- ![Interaction preview](assets/showcase/interaction-01.gif) -->

<!-- Future GIF: assets/showcase/interaction-02.gif -->
<!-- ![Transition preview](assets/showcase/interaction-02.gif) -->

### Video demonstrations

<!-- Future thumbnail: assets/showcase/video-01-thumbnail.png -->
<!-- [![Watch demo video](assets/showcase/video-01-thumbnail.png)](https://github.com/YOUR-USERNAME/PROJECT-NAME/releases) -->


---

## License

[MIT License](LICENSE).
