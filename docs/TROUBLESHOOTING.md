# Wallpaper Troubleshooting & Emergency Recovery

## Emergency Stop

If video wallpaper causes compositor lag, high GPU temps, or freezes:

```bash
# 1. Kill player process immediately:
pkill -9 mpvpaper 2>/dev/null || true

# 2. Stop and disable the user service:
systemctl --user stop omarchy-wallpaper-player.service 2>/dev/null || true
systemctl --user disable omarchy-wallpaper-player.service 2>/dev/null || true

# 3. Restore static wallpaper:
omarchy theme bg refresh
```

## Common Issues

- **Black background after uninstalling video player**:
  Run `omarchy theme bg next` or `omarchy theme set <active-theme>` to re-link your static background.
- **High CPU usage during video playback**:
  Ensure hardware acceleration is active in `mpv`: add `hwdec=auto-safe` to your player options.
