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

## ✨ BIG UPDATE: Premium Gaming UI Overhaul

Gory OS has received a major visual overhaul to provide a premium experience infused with a dark, gaming aesthetic!
- **Classic Window Controls**: Left-aligned Red, Yellow, and Green buttons.
- **Floating Dock**: A centered, floating bottom dock for all your favorite applications.
- **Minimalist Top Panel**: A distraction-free, slim top bar for the clock and system tray.
- **Tela Circle Green Icons**: Premium, rounded icons with neon green accents.
- **Breeze Dark Theme**: Fully automated dark mode across the entire system.

## 🚀 How to Test Gory OS (UTM Tutorial)

If you are using Apple Silicon (M1/M2/M3/M4) and want to test the Gory OS Live Environment, follow these steps:

1. **Download the ISO**: Go to the **Actions** tab in this repository, click the latest green checkmark build, and download `Gory-ISO` from the Artifacts section.
2. **Download UTM**: Download and install [UTM](https://mac.getutm.app/).
3. **Create VM**: Open UTM, click **"+"** -> **Emulate** -> **Linux**.
4. **Boot ISO**: In the "Boot ISO Image" section, click **Browse** and select the downloaded Gory ISO.
5. **Configure Hardware**: 
   - Under **Architecture**, you MUST select `x86_64` (e.g. `Intel ICH9 based PC (2009, x86_64)`).
   - Set **Memory** to at least `4096` MB.
   - Set **CPU Cores** to `4` or `6`.
6. **Start**: Save the VM and click the Play button to boot into Gory OS!
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
