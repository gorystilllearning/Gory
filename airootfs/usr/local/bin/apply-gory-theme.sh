#!/usr/bin/env bash

# Wait for Plasma to fully load
sleep 5

# Apply Breeze Dark Theme
kwriteconfig6 --file kdeglobals --group General --key ColorScheme BreezeDark
kwriteconfig6 --file kdeglobals --group KDE --key LookAndFeelPackage org.kde.breezedark.desktop

# Apply Kvantum theme
kwriteconfig6 --file kdeglobals --group KDE --key widgetStyle kvantum

# Copy Custom Calamares Branding
sudo cp -a /opt/gory-branding/etc/calamares/* /etc/calamares/ 2>/dev/null || true
sudo cp -a /opt/gory-branding/usr/share/calamares/* /usr/share/calamares/ 2>/dev/null || true

# Apply Candy Icon Theme
kwriteconfig6 --file kdeglobals --group Icons --key Theme candy-icons

# Apply Premium Window Decorations (McMojave and buttons on left)
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme __aurorae__svg__McMojave
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft XIA
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight ""

# Enable Wobbly Windows effect
kwriteconfig6 --file kwinrc --group Plugins --key wobblywindowsEnabled true

# Reconfigure KWin to apply window decoration changes immediately
qdbus org.kde.KWin /KWin reconfigure

# Set wallpaper via Plasma 6 CLI tool
plasma-apply-wallpaperimage /usr/share/backgrounds/gory-wallpaper.jpg

# Remove the autostart desktop file so it only runs on first boot
rm -f ~/.config/autostart/apply-gory-theme.desktop

# Set fastfetch alias to use custom logo
# Set fastfetch alias and Starship prompt
echo 'fastfetch --logo /usr/share/pixmaps/gory-installer-logo.png --logo-type chafa --logo-width 35' >> ~/.bashrc
echo 'eval "$(starship init bash)"' >> ~/.bashrc
echo 'fastfetch --logo /usr/share/pixmaps/gory-installer-logo.png --logo-type chafa --logo-width 35' >> ~/.zshrc
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
