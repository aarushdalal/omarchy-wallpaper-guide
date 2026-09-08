#!/usr/bin/env bash
# ==============================================================================
# Helper for omarchy-wallpaper-guide
# Provides safe user inspection and configuration setup.
# NEVER enables video wallpapers automatically.
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/omarchy-wallpaper-player"
DRY_RUN=0

for arg in "$@"; do
  [[ "$arg" == "--dry-run" ]] && DRY_RUN=1
done

run_cmd() {
  if (( DRY_RUN )); then echo "[DRY-RUN] $*"; else "$@"; fi
}

check_deps() {
  echo "Checking wallpaper tools..."
  if command -v omarchy >/dev/null 2>&1; then
    echo "  [OK] Omarchy is available"
  fi
  if command -v mpvpaper >/dev/null 2>&1; then
    echo "  [OK] mpvpaper is installed"
  else
    echo "  [NOTE] mpvpaper is not installed (optional for video wallpapers)"
  fi
  if command -v mpv >/dev/null 2>&1; then
    echo "  [OK] mpv is installed"
  else
    echo "  [NOTE] mpv is not installed"
  fi
}

do_install() {
  check_deps
  echo "Setting up example wallpaper player configuration..."
  run_cmd mkdir -p "$CONFIG_DIR"
  if [[ ! -f "$CONFIG_DIR/config.toml" ]]; then
    run_cmd cp "$SCRIPT_DIR/examples/wallpaper-config.example.toml" "$CONFIG_DIR/config.toml"
    echo "Created template configuration at $CONFIG_DIR/config.toml"
  fi
  echo ""
  echo "NOTE: Video wallpapers are NOT enabled automatically."
  echo "See docs/VIDEO-WALLPAPERS.md for instructions on adding your videos and starting the service."
}

do_status() {
  echo "=== Wallpaper Player Status ==="
  if pgrep -f "mpvpaper" >/dev/null 2>&1; then
    echo "  Live player: RUNNING"
  else
    echo "  Live player: STOPPED (normal static Omarchy wallpaper active)"
  fi
}

do_stop() {
  echo "Stopping optional wallpaper player..."
  run_cmd pkill -9 -f "mpvpaper" 2>/dev/null || true
  run_cmd systemctl --user stop omarchy-wallpaper-player.service 2>/dev/null || true
  echo "Player stopped. Normal static background restored."
}

do_uninstall() {
  do_stop
  echo "Uninstalling wallpaper player configuration..."
  if [[ -d "$CONFIG_DIR" ]]; then
    run_cmd rm -rf "$CONFIG_DIR"
  fi
  echo "Wallpaper player uninstalled."
}

case "${1:-check}" in
  check) check_deps ;;
  install) do_install ;;
  status) do_status ;;
  stop) do_stop ;;
  disable) do_stop ;;
  uninstall) do_uninstall ;;
  *)
    echo "Usage: $0 {check|install|status|stop|disable|uninstall} [--dry-run]"
    exit 1
    ;;
esac
