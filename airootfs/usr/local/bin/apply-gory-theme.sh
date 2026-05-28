#!/usr/bin/env bash

# Wait for Plasma to fully load
sleep 5

# Apply Breeze Dark Theme
kwriteconfig6 --file kdeglobals --group General --key ColorScheme BreezeDark
kwriteconfig6 --file kdeglobals --group KDE --key LookAndFeelPackage org.kde.breezedark.desktop

# Apply Tela Circle Green Icon Theme
kwriteconfig6 --file kdeglobals --group Icons --key Theme Tela-circle-green

# Apply Mac-style Window Decorations (McMojave and buttons on left)
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme McMojave
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft XMA
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight ""

# Reconfigure KWin to apply window decoration changes immediately
qdbus org.kde.KWin /KWin reconfigure

# Set wallpaper via Plasma 6 CLI tool
plasma-apply-wallpaperimage /usr/share/backgrounds/gory-wallpaper.jpg

# Remove the autostart desktop file so it only runs on first boot
rm -f ~/.config/autostart/apply-gory-theme.desktop

# Set up fastfetch auto-start for this user
echo 'fastfetch --logo /usr/share/pixmaps/gory-logo.jpg --logo-width 30' >> ~/.bashrc
echo 'fastfetch --logo /usr/share/pixmaps/gory-logo.jpg --logo-width 30' >> ~/.zshrc
