# Gory

Gory is an open-source, Arch-based Linux distribution optimized for PC gaming. Built on top of the powerful `archiso` tool, this project provides a streamlined gaming experience out-of-the-box, featuring KDE Plasma, Gamescope, and tools to seamlessly play Windows games.

## Features

- **Base**: Arch Linux
- **Desktop Environment**: KDE Plasma (Wayland)
- **Gaming Tools Pre-installed**: 
  - Steam
  - Gamescope (Micro-compositor)
  - MangoHud (Performance overlay)
  - Lutris & Heroic Games Launcher
  - Wine & ProtonUp-Qt
- **Third-Party Launchers Support**: Pre-configured scripts to install non-Steam launchers (EA App, Ubisoft Connect, Rockstar Games Launcher, etc.) via Proton.

## Building the ISO

This repository uses GitHub Actions to automatically build the ISO file. 
Whenever code is pushed to the `main` branch, the `.github/workflows/build-iso.yml` action will trigger, spin up an Arch Linux container, run the `archiso` build process, and attach the resulting `.iso` file to the GitHub Releases page.

To build it manually on an Arch Linux host:
```bash
sudo pacman -S archiso
sudo mkarchiso -v -w /tmp/archiso-tmp -o /tmp/archiso-out /path/to/gory
```

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.
