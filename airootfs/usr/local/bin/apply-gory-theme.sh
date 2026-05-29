#!/usr/bin/env bash

# Wait for Plasma to fully load
sleep 5

# Copy Custom Calamares Branding
sudo cp -a /opt/gory-branding/etc/calamares/* /etc/calamares/ 2>/dev/null || true
sudo cp -a /opt/gory-branding/usr/share/calamares/* /usr/share/calamares/ 2>/dev/null || true

# Set wallpaper via Plasma 6 CLI tool with retry loop
for i in {1..10}; do
    if plasma-apply-wallpaperimage /usr/share/backgrounds/gory-wallpaper.jpg; then
        break
    fi
    sleep 2
done

# Remove the autostart desktop file so it only runs on first boot
rm -f ~/.config/autostart/apply-gory-theme.desktop

