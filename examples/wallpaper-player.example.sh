#!/usr/bin/env bash
# Optional wallpaper player helper
set -euo pipefail

CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/omarchy-wallpaper-player/config.toml"

if ! command -v mpvpaper >/dev/null 2>&1; then
  echo "Error: mpvpaper is required for video wallpaper." >&2
  exit 1
fi

echo "Wallpaper player helper ready. Inspect $CONFIG_FILE to configure."
