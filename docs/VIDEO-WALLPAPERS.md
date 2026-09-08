# Optional Video / Live Wallpaper Guide

> **Notice**: Themes work without live wallpapers. Video wallpaper support is optional, experimental, completely separate from themes, and removable without affecting theme colors, Omarchy configuration, or compositor stability.

## Prerequisites

Video wallpaper playback requires Wayland video rendering tools such as `mpvpaper` and `mpv`:

```bash
# On Arch Linux:
sudo pacman -S mpv
yay -S mpvpaper
```

## Architecture & Separation

- **Separate Configuration**: Kept strictly in `~/.config/omarchy-wallpaper-player/config.toml` (never touching `shell.json` or `colors.toml`).
- **Separate Systemd User Service**: `~/.config/systemd/user/omarchy-wallpaper-player.service`.
- **Zero Desktop Overwrites**: Never replaces Omarchy shell files or Hyprland configurations.

## Hardware & System Risks

1. **Power Consumption**: Continuous video decoding consumes battery on laptops. Hardware video acceleration (`vaapi`) is highly recommended.
2. **Multi-Monitor / Suspend**: Video players may pause or require restart after system suspend.
3. **Emergency Stop**: If your desktop slows down or becomes unstable, run:
   ```bash
   pkill -9 mpvpaper
   systemctl --user stop omarchy-wallpaper-player.service 2>/dev/null || true
   ```
