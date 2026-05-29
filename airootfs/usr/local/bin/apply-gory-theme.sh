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

# Configure bash and zsh for the live user
for rc in /root/.bashrc /root/.zshrc /etc/skel/.bashrc /etc/skel/.zshrc; do
    if [ -f "$rc" ] || [ -d "$(dirname "$rc")" ]; then
        if ! grep -q "starship init" "$rc" 2>/dev/null; then
            echo '' >> "$rc"
            echo 'alias ls="ls --color=auto"' >> "$rc"
            echo 'alias grep="grep --color=auto"' >> "$rc"
            echo 'if [ -n "$BASH_VERSION" ]; then' >> "$rc"
            echo '    eval "$(starship init bash)"' >> "$rc"
            echo 'elif [ -n "$ZSH_VERSION" ]; then' >> "$rc"
            echo '    eval "$(starship init zsh)"' >> "$rc"
            echo 'fi' >> "$rc"
            echo 'if [ -z "$FASTFETCH_RUN" ]; then' >> "$rc"
            echo '    export FASTFETCH_RUN=1' >> "$rc"
            echo '    fastfetch --logo /usr/share/pixmaps/gory-installer-logo.png --logo-type chafa --logo-width 35' >> "$rc"
            echo 'fi' >> "$rc"
        fi
    fi
done

# Reconfigure KWin to apply window decoration changes immediately
qdbus org.kde.KWin /KWin reconfigure

# Set wallpaper via Plasma 6 CLI tool with retry loop
for i in {1..10}; do
    if plasma-apply-wallpaperimage /usr/share/backgrounds/gory-wallpaper.jpg; then
        break
    fi
    sleep 2
done

# Remove the autostart desktop file so it only runs on first boot
rm -f ~/.config/autostart/apply-gory-theme.desktop

