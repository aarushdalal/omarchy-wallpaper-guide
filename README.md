# Omarchy Wallpaper Guide (`omarchy-wallpaper-guide`)

> **Unofficial / Community Documentation**: Comprehensive guide to static backgrounds and optional live video wallpapers on Omarchy Hyprland.

A reference guide, configuration templates, and troubleshooting procedures for managing desktop wallpapers in Omarchy — covering both the native static wallpaper flow and the optional mpvpaper video wallpaper setup.

This project was developed through an AI-assisted workflow. The concept, customization, configuration, testing, integration, and final iteration were directed and carried out by me.

---

## My Contribution

I did not write Omarchy, Quickshell, Hyprland, or mpvpaper from scratch. What I contributed:

- **Documentation**: Authored comprehensive guides for both static and live video wallpapers on Omarchy, covering file placement, native Omarchy commands, mpvpaper configuration, and systemd service setup.
- **Configuration Templates**: Designed and documented the `~/.config/omarchy-wallpaper-player/config.toml` format and `systemd/omarchy-wallpaper-player.service` template.
- **Install Script**: Authored `./install.sh` with `stop` command for emergency rollback without modifying Omarchy core files.
- **Hardware & Battery Risk Documentation**: Documented GPU utilization, battery drain, and suspend/resume implications specific to Wayland/Hyprland live wallpaper setups.
- **Emergency Procedures**: Wrote and tested the emergency stop and rollback procedures.
- **Separation of Concerns**: Clearly documented that video wallpapers are fully isolated from theme colors (`colors.toml`) and Omarchy configuration (`shell.json`) — they can be removed at any time without affecting the active theme.
- **Testing**: Tested all procedures on Omarchy 4.0.2 / Hyprland 0.56.2 with mpvpaper on AMD Radeon Vega graphics.

---

## Based On / Credits

- **[Omarchy](https://github.com/basecamp/omarchy)** — The open-source Arch Linux desktop environment by Basecamp. Static wallpapers are fully supported natively via Omarchy's `omarchy theme bg next` and `omarchy theme bg-switcher` commands.
- **[Hyprland](https://hyprland.org)** — The Wayland tiling compositor on which the desktop runs.
- **[Quickshell](https://quickshell.outfoxxed.me)** — The Qt6 QML desktop shell used alongside Omarchy.
- **[mpvpaper](https://github.com/GhostNaN/mpvpaper)** — The Wayland wallpaper daemon using mpv for video playback, used for the optional live wallpaper setup.
- **[mpv](https://mpv.io)** — The open-source media player that mpvpaper wraps.

**Related Repos**:
- [omarchy-aesthetic-themes](https://github.com/aarushdalal/omarchy-aesthetic-themes) — 15 anime themes with matched live video wallpapers
- [omarchy-theme-transitions](https://github.com/aarushdalal/omarchy-theme-transitions) — GPU theme transition shaders
- [omarchy-shell-polish](https://github.com/aarushdalal/omarchy-shell-polish) — Frosted glass and bar layout snippets

---

## Important Principle

> Themes work without live wallpapers. Video wallpaper support is **optional**, **separate** from themes, and **removable** without affecting theme colors, Omarchy configuration, or the rest of the desktop.

**No copyrighted downloaded wallpapers or video files are bundled in this repository.**

---

## Table of Contents

- [Static Wallpapers (Standard Flow)](#static-wallpapers-standard-flow)
- [Optional Video Wallpapers](#optional-video-wallpapers)
- [Hardware & Battery Risks](#hardware--battery-risks)
- [Emergency Stop & Rollback](#emergency-stop--rollback)
- [Repository Structure](#repository-structure)
- [License](#license)

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

See [docs/STATIC-WALLPAPERS.md](docs/STATIC-WALLPAPERS.md) for full instructions, including using multiple wallpapers per theme and the Omarchy background IPC command (`omarchy-theme-bg-set <path>`).

---

## Optional Video Wallpapers

Video wallpapers run via an isolated, user-owned background player (`mpvpaper`).

- **Requirements**: `mpv` and `mpvpaper` from AUR:
  ```bash
  sudo pacman -S mpv
  yay -S mpvpaper
  ```
- **Configuration Path**: `~/.config/omarchy-wallpaper-player/config.toml`
- **Optional Service**: `~/.config/systemd/user/omarchy-wallpaper-player.service`
- **Safety**: Never modifies `shell.json`, `colors.toml`, or any Omarchy core file.

See [docs/VIDEO-WALLPAPERS.md](docs/VIDEO-WALLPAPERS.md) for full setup instructions, systemd service configuration, and IPC socket hot-swapping.

---

## Hardware & Battery Risks

| Risk | Detail |
|---|---|
| **CPU & GPU Utilization** | Video decoding adds constant GPU load even on idle desktops |
| **Battery Drain** | Continuous video playback significantly reduces laptop battery life |
| **Suspend / Resume** | Wayland surfaces may require re-initialization after waking from sleep |
| **Thermal Throttling** | Extended playback on integrated graphics may cause sustained heat |

For laptop users, consider enabling `auto-pause` in the mpvpaper configuration to pause video playback on battery.

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

## Repository Structure

```
omarchy-wallpaper-guide/
├── docs/
│   ├── STATIC-WALLPAPERS.md     # Complete static wallpaper guide
│   └── VIDEO-WALLPAPERS.md      # Video wallpaper setup and service files
├── examples/                    # Configuration templates
│   ├── config.example.toml      # mpvpaper config template
│   └── omarchy-wallpaper-player.service  # Systemd service template
├── assets/showcase/
├── install.sh
└── CHANGELOG.md
```

---

## Related Documentation

- 📄 [Static Wallpapers Guide](docs/STATIC-WALLPAPERS.md)
- 🎬 [Video Wallpapers Guide](docs/VIDEO-WALLPAPERS.md)

---

## License

[MIT License](LICENSE).

---

## Credits / Third-Party Notices

- Written for the [Omarchy](https://github.com/basecamp/omarchy) desktop environment.
- Video wallpaper setup uses [mpvpaper](https://github.com/GhostNaN/mpvpaper) and [mpv](https://mpv.io/).
- Powered by [Hyprland](https://hyprland.org/) and [Quickshell](https://quickshell.outfoxxed.me/).
- Not an official Omarchy product.
