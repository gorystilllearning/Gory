#!/usr/bin/env bash

# Wait for Plasma to fully load
sleep 5

# Apply Breeze Dark Theme
kwriteconfig6 --file kdeglobals --group General --key ColorScheme BreezeDark
kwriteconfig6 --file kdeglobals --group KDE --key LookAndFeelPackage org.kde.breezedark.desktop

# Apply Tela Circle Green Icon Theme
kwriteconfig6 --file kdeglobals --group Icons --key Theme Tela-circle-green

# Apply Mac-style Window Decorations (WhiteSur-dark and buttons on left)
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key theme WhiteSur-dark
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft XMA
kwriteconfig6 --file kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight ""

# Reconfigure KWin to apply window decoration changes immediately
qdbus org.kde.KWin /KWin reconfigure

# Configure Panels and Wallpaper via Plasma scripting
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript string:"
var panels = panels();
if (panels.length > 0) {
    panels[0].location = 'top';
    panels[0].height = 24;
}

var dock = new Panel;
dock.location = 'bottom';
dock.height = 48;
dock.alignment = 'center';
dock.lengthMode = 'fit';
dock.floating = true;
dock.addWidget('org.kde.plasma.icontasks');

var Desktops = desktops();
for (i=0; i<Desktops.length; i++) {
    d = Desktops[i];
    d.wallpaperPlugin = 'org.kde.image';
    d.currentConfigGroup = Array('Wallpaper', 'org.kde.image', 'General');
    d.writeConfig('Image', 'file:///usr/share/backgrounds/gory-wallpaper.jpg');
}
"

# Remove the autostart desktop file so it only runs on first boot
rm -f ~/.config/autostart/apply-gory-theme.desktop
