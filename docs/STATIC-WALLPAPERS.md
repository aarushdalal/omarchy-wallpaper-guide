# Static Wallpapers Guide for Omarchy

Themes work without live wallpapers. Omarchy provides native background management for static wallpapers.

## Standard Procedure

1. **Obtain Legal Wallpapers**:
   Download or create high-resolution wallpapers (`1920x1080`, `2560x1440`, or `3840x2160`) that you have the legal right to use.
2. **Place in Theme Backgrounds Folder**:
   Place image files (`.png`, `.jpg`, `.jpeg`, `.webp`) in the target theme directory:
   ```bash
   ~/.config/omarchy/themes/<theme-slug>/backgrounds/
   ```
   *Naming Recommendation*: Name the primary image `wallpaper_name.png` or `<theme-slug>.png`.
3. **Select Your Wallpaper**:
   - Via Omarchy CLI:
     ```bash
     omarchy theme bg next
     ```
   - Via Background Switcher:
     ```bash
     omarchy theme bg-switcher
     ```
   - Set directly:
     ```bash
     omarchy theme bg set ~/.config/omarchy/themes/<theme-slug>/backgrounds/my-wallpaper.png
     ```
